//  Created by DerekGill on 11/08/2019.
//  Copyright © 2019 DerekGill. All rights reserved.
//
// THIS CODE IS MOSTLY FROM SAGNOR "ALEX" NAGY FROM REBELOPER.COM
// I HAVE SLIGHTLY MODIFIED THE CODE AS I WENT ALONG THE YOUTUBE TUTORIAL : https://www.youtube.com/watch?v=yWB5Md7PHwU&t=21s
// I HOPE YOU ENJOY THE CHANGES

import UIKit
var firstDisplayIndex = 0
class firstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var firstTableView: UITableView!
    @IBAction func refreshButton(_ sender: UIBarButtonItem!) {
        wordList.shuffle()
        defaults.set(wordList, forKey: "wordList")
        firstTableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        wordList = defaults.object(forKey: "wordList") as! [String]
        firstTableView.delegate = self
        firstTableView.dataSource = self
        self.firstTableView.tableFooterView = UIView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for element in wordList {
            if(learnedWords.contains(element)) {
                wordList.remove(at: wordList.index(of: element)!)
            }
        }
        let selectedRow: IndexPath? = firstTableView.indexPathForSelectedRow
        if let selectedRowNotNill = selectedRow {
            firstTableView.deselectRow(at: selectedRowNotNill, animated: true)
        }
        firstTableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(wordList.count >= 8) {
            return 8
        }
        return wordList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.firstTableView.dequeueReusableCell(withIdentifier: "cellFirst") as UITableViewCell!
        cell.textLabel?.text = wordList[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        firstDisplayIndex = indexPath.row
        performSegue(withIdentifier: "firstSegue", sender: self)
    }
}
