//
//  BreakingBadCharacterVC.swift
//  BreakingBadCharacterExplorerApp
//
//  Created by Muhammad Luqman on 11/29/20.
//

import UIKit

class BreakingBadCharacterVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Property
    private var searchBarController: UISearchController!
    private var viewModel = BreakingBadCharacterViewModel()
    
    private var selectedCellData: BreakingBadCharactersCellViewModel?
    
    private var isFirstTimeActive = true
    let identifierCell = "BreakingBadCharactersCell"
    let segueIdentifier = "DetailVC"
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        viewModelClosures()
        
        // Api call.
        viewModel.fetchData() {
            print("search completed.")
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        if isFirstTimeActive {
            searchBarController.isActive = false
            isFirstTimeActive = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func showAlert(title: String = "Breaking Bad Character", message: String?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title:NSLocalizedString("OK", comment: ""), style: UIAlertAction.Style.default) {(action) in
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - prepare Segue
    // perform Segue for detail screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if(segue.identifier == segueIdentifier){
            
            guard let detailVC = segue.destination as? DetailVC else {
                return
            }
            
            //Passes data for detail view controller
            if let data = selectedCellData{
                let vm = DetailViewModel(data: data)
                detailVC.detailViewModel = vm
            }
        }
    }
}

//MARK:- Configure UI
extension BreakingBadCharacterVC {
    
    fileprivate func configureUI() {
        // Do any additional setup after loading the view, typically from a nib.
        
        createSearchBar()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        
        // Set table row height
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        // Set table footer view
        tableView.tableFooterView = UIView()
        
    }
}

//MARK:- Clousers
extension BreakingBadCharacterVC {
    
    fileprivate func viewModelClosures() {
        
        //Show alert view on error
        viewModel.showAlert = { [weak self] (message) in
            self?.searchBarController.isActive = false
            self?.showAlert(message: message)
        }
        
        viewModel.dataUpdated = { [weak self] in
            print("data source updated")
            self?.tableView.reloadData()
        }
    }
    
}

//MARK:- UISearchBarDelegate
extension BreakingBadCharacterVC: UISearchControllerDelegate, UISearchBarDelegate {
    
    //Create UISearch Bar
    private func createSearchBar() {
        
        searchBarController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchBarController
        searchBarController.delegate = self
        searchBarController.searchBar.delegate = self
        searchBarController.obscuresBackgroundDuringPresentation = false
        searchBarController.searchBar.returnKeyType = .done
        
    }
    
    //Called when text Did Change
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchBar.showsCancelButton = true
        viewModel.filterResult(searchText: searchText)
        
    }
    
    //Called when tap search Bar Cancel Button Clicked
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        if searchBar.text?.count == 0 {
            searchBar.showsCancelButton = false
            viewModel.filterResult(searchText: "")
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
        
    }
    
}


//MARK:- UItableViewDataSource, UITableViewDelegate
extension BreakingBadCharacterVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.dataSource.count
    }
    
    //Show cell for row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifierCell, for: indexPath) as? BreakingBadCharactersCell else {
            
            return UITableViewCell()
        }
        
        cell.viewModel = self.viewModel.dataSource[indexPath.row]
        return cell
    }
    
    //Set row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    // Called when tap on cell.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedCellData = self.viewModel.dataSource[indexPath.row]
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
        
    }
    
}




