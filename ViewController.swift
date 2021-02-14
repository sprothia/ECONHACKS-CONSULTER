   @IBOutlet weak var tf: UITextField!
    
    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var summary: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let growthRevenue = (((afterRevenue - beforeRevenue) / (beforeRevenue)))
        let growthASP = (((afterASP - beforeASP) / (beforeASP)))
        let total = (goodRevenue + goodEPS + goodPE + goodPTB + goodASP + fam + excellent + verylikely)
        parseAAPLCSV()
        print(total)
        
        
            self.rating?.text = "Good"
            self.summary?.text = "This company may be a solid investment for you because it has strong financials and cause you like the product. Please do your own research and financial analysis before considering."
    
        
        
        if (beforeEPS * 1.25) < afterEPS {
            goodEPS = 1
        } else if (beforeEPS * 1.25) > afterEPS {
            goodEPS = 0
        }
        
        if growthRevenue > 0.15 {
            goodRevenue = 1
        
        } else {
            goodRevenue = 0
        }
        
        if afterPE < 50 {
            goodPE = 1
        } else if afterPE > 50 {
            goodPE = 0
        }
        
        if afterPTB > 1.2 {
            goodPTB = 0
        } else if afterPTB < 1.2 {
            goodPTB = 1
        }
        
        if growthASP > 0.12 {
            goodASP = 1
        } else {
            goodASP = 0
        }
    


        self.bEPS?.text = String(beforeEPS)
        self.bPTB?.text = String(beforePTB)
        self.bRevenue?.text = String(beforeRevenue)
        self.bASP?.text = String(beforeASP)
        self.bPE?.text = String(beforePE)
        
//        self.aASP?.text = String(afterASP)
        self.aPTB?.text = String(afterPTB)
        self.aRevenue?.text = String(afterRevenue)
        self.aEPS?.text = String(afterEPS)
        self.aPE?.text = String(afterPE)



        self.tf?.delegate = self
        
    }
    
    func parseAAPLCSV() {
        let path = Bundle.main.path(forResource: "AAPL", ofType: "csv")!
        
        do {
            
            var data = ""
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            let t = data.components(separatedBy: ",")
            let colums = csv.columns
            for column in colums {
                let columns = data.components(separatedBy: ",")
                
            }
            
         
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
