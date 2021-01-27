//  Created by DerekGill on 11/08/2019.
//  Copyright © 2019 DerekGill. All rights reserved.
//
// THIS CODE IS MOSTLY FROM SAGNOR "ALEX" NAGY FROM REBELOPER.COM
// I HAVE SLIGHTLY MODIFIED THE CODE AS I WENT ALONG THE YOUTUBE TUTORIAL : https://www.youtube.com/watch?v=yWB5Md7PHwU&t=21s
// I HOPE YOU ENJOY THE CHANGES

import UIKit
class secondWordViewController: UIViewController {
    @IBOutlet weak var wordInformation: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Unlearn", style: .plain, target: self, action: #selector(unlearnWord))
        wordInformation.text = learnedWords[secondDisplayIndex]
        let separated = learnedWords[secondDisplayIndex].components(separatedBy: "-")
        let title = separated[0].trimmingCharacters(in: .whitespacesAndNewlines)
        self.navigationItem.title = title
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func unlearnWord () {
        if let index = learnedWords.index(of: learnedWords[secondDisplayIndex]) {
            learnedWords.remove(at: index)
            defaults.set(learnedWords, forKey: "learnedWords")
        }
        self.navigationController?.popToRootViewController(animated: true)
     }
}
