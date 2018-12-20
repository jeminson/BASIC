# Simple Core Data
- Used **CoreData** framework 



## Steps 
- Getting Started 
  + Select Core Data module when creating new project (It will automatically create the Core Data Stack)

- Data Model 
  + Add Entities 
  + Add Attributes 

- Add Records to Core Data
  1. Refer to persistentContainer 
  
      ```let appDelegate = UIApplication.shared.delegate as! AppDelegate```
  
  2. Create the context 
  
      ```let context = appDelegate.persistentContainer.viewContext```

  3. Create an entity 
  4. Create new record 
  5. Set values for the records for each key
  6. Save the Data
