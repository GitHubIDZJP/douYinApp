import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()

    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.showsBookmarkButton = true
        searchBar.backgroundColor = .purple
        return searchBar
    }()

    var sourcePlacemark: MKPlacemark?
    var destinationPlacemark: MKPlacemark?
    var route: MKRoute?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()

        // 设置赣州火车站的坐标
        let ganzhouTrainStationCoordinate = CLLocationCoordinate2D(latitude: 25.8453, longitude: 114.9308)
        sourcePlacemark = MKPlacemark(coordinate: ganzhouTrainStationCoordinate)
    }

    func setupUI() {
        searchBar.frame = CGRect(x: 0, y: 88, width: view.bounds.width, height: 44) // 暂时将 y 坐标设为 88 以避免 DeviceUtils 引起的问题
        searchBar.delegate = self
        self.view.addSubview(searchBar)
        
        mapView.frame = CGRect(x: 0, y: searchBar.frame.maxY, width: view.bounds.width, height: view.bounds.height - searchBar.frame.maxY)
        mapView.delegate = self
        self.view.addSubview(mapView)
    }

    func setupConstraints() {
        // 如果使用 Auto Layout，可以在这里添加约束
    }

    func getDirections() {
        guard let sourcePlacemark = sourcePlacemark, let destinationPlacemark = destinationPlacemark else {
            return
        }

        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)

        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile

        let directions = MKDirections(request: directionRequest)

        directions.calculate { (response, error) in
            guard let response = response else {
                if let error = error {
                    print("Error calculating directions: \(error.localizedDescription)")
                }
                return
            }

            self.route = response.routes.first

            if let route = self.route {
                self.mapView.addOverlay(route.polyline, level: .aboveRoads)

                let rect = route.polyline.boundingMapRect
                self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
            }
        }
    }

    // MARK: - MKMapViewDelegate

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let routePolyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: routePolyline)
            renderer.strokeColor = .blue
            renderer.lineWidth = 5.0
            return renderer
        }
        return MKOverlayRenderer()
    }
}

extension MapViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // 隐藏键盘

        guard let searchText = searchBar.text else {
            return
        }

        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(searchText) { (placemarks, error) in
            guard let placemark = placemarks?.first else {
                if let error = error {
                    print("Geocoding error: \(error.localizedDescription)")
                }
                return
            }

            // 在地图上显示搜索结果
            let annotation = MKPointAnnotation()
            annotation.coordinate = placemark.location!.coordinate
            annotation.title = searchText
            self.mapView.addAnnotation(annotation)

            // 设置地图显示区域
            let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            let region = MKCoordinateRegion(center: placemark.location!.coordinate, span: span)
            self.mapView.setRegion(region, animated: true)

            // 设置目的地
            self.destinationPlacemark = MKPlacemark(placemark: placemark)

            // 获取导航路线
            self.getDirections()
        }
    }

    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        // 这里处理点击书签按钮后的操作
    }
}

