//
//  FirstPageForcastViewController.swift
//  forecastData
//
//  Created by Sorasak on 12/16/19.
//  Copyright © 2019 Dol2oMo. All rights reserved.
//

import UIKit

protocol FirstPageForcastViewControllerInput {
    
}

protocol FirstPageForcastViewControllerOutput {
    
    func settingDataToSecondPage(city: String)
}

class FirstPageForcastViewController: UIViewController, FirstPageForcastViewControllerInput {
    
    var output: FirstPageForcastViewControllerOutput?
    var router: FirstPageForcastRouter?
    private let city = ["Bangkok", "Hua Hin", "Trat"]
    @IBOutlet weak var myTabelView: UITableView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        FirstPageForcastConfiguration.sharedInstant.configuration(viewController: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
}

extension FirstPageForcastViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return city.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = city[0]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        output?.settingDataToSecondPage(city: city[indexPath.row])
        router?.navigateToNextScenes(scenes: SegueIdentifiers.secoundPage)
    }
    
}
