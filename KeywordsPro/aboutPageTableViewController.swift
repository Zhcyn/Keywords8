//  Created by DerekGill on 11/08/2019.
//  Copyright © 2019 DerekGill. All rights reserved.
//
// THIS CODE IS MOSTLY FROM SAGNOR "ALEX" NAGY FROM REBELOPER.COM
// I HAVE SLIGHTLY MODIFIED THE CODE AS I WENT ALONG THE YOUTUBE TUTORIAL : https://www.youtube.com/watch?v=yWB5Md7PHwU&t=21s
// I HOPE YOU ENJOY THE CHANGES

import UIKit
class aboutPageTableViewController: UITableViewController {
    @IBOutlet var aboutPageTableView: UITableView!
    @IBOutlet weak var howToLabel: UILabel!
    @IBAction func clearAllButton(_ sender: UIButton) {
        let clearAlert = UIAlertController(title: "Clear all memory words", message: "Are you sure?\n All the words you have learned will be lost.", preferredStyle: UIAlertControllerStyle.alert)
        clearAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (action: UIAlertAction!) in
            learnedWords.removeAll()
            defaults.set(learnedWords, forKey: "learnedWords")
        }))
        clearAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("nothing")
        }))
        present(clearAlert, animated: true, completion: nil)
    }
    @IBAction func writeReviewButton(_ sender: UIButton) {
        let reviewAlert = UIAlertController(title: "Feedback!", message: "Click \"OK\" to open the app store.", preferredStyle: UIAlertControllerStyle.alert)
        reviewAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            if let url = URL(string: "itms-apps:itunes.apple.com/us/app/apple-store/id\(1550795928)?mt=8&action=write-review") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))
        reviewAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("nothing")
        }))
        present(reviewAlert, animated: true, completion: nil)
    }
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var contactMeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.aboutPageTableView.tableFooterView = UIView()
        self.aboutPageTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        howToLabel.text = "\u{2022} In the 'Words to learn' tab, eight random words are displayed. Tap the button in the upper right corner to refresh the list of eight new words. \n\u{2022} In the 'Learning Words' tab, the words you have learned are displayed. To learn a word, tap any word to enlarge it. In the upper right corner, you can click 'Learn' to learn words. To cancel learning a word, click the word again, and then click 'Cancel Learning'. The title of this tab also shows the scores and percentages of all words learned. \n\u{2022} In the 'All words' tab, you can use the scroll bar on the right to browse all words, or use the search bar to search for specific words. A learner will have a check mark in its cell to indicate that it has been learned."
        howToLabel.padding = UIEdgeInsets(top: 10, left: 2, bottom: 10, right: 2)
        historyLabel.text = "\u{2022} This project started with something I wanted to cross off my word list: learn eight new words every day to help improve my vocabulary. \n\u{2022} I also want to create an iOS application, so I decided to complete two tasks at once: create an application to help me improve my vocabulary. \n\u{2022} Currently, the word book only extracts words from 3 sites, but more words will be added in the future! \n\u{2022}"
        historyLabel.padding = UIEdgeInsets(top: 10, left: 2, bottom: 10, right: 2)
        contactMeLabel.text = "If you have any other feedback or comments, please feel free to contact me via the following email raynekatelyn87@gmail.com."
        contactMeLabel.padding = UIEdgeInsets(top: 10, left: 2, bottom: 10, right: 2)
        aboutPageTableView.rowHeight = UITableViewAutomaticDimension
        aboutPageTableView.estimatedRowHeight = UITableViewAutomaticDimension
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
}
