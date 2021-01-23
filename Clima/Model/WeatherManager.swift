
import Foundation

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=15d34b88de5cc9b7055e636ffe848e20&units=metric"
    
    func fetchWeather(cityName: String)
    {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        //create a URL
        if let url = URL(string: urlString){
            // create a urlsession
            let session = URLSession(configuration: .default)
            // give the session a task
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            //start the task
            task.resume()
            
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?)
    {
        if error != nil{
            print(error!)
            return
        }
        if let safeData = data{
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}
