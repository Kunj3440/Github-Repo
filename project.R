library(dplyr)
library(readxl)
refine <- read_excel("~/Downloads/refine.xlsx")
refine
 #1: Clean up brand names
refine[1:6, 1] = "phillips"  
  refine[14:16, 1] = "phillips"
    refine[7:13, 1] = "akzo"
      refine[17:21, 1] = "van houten"
        refine[22:25, 1] = "unilever"
refine
library(tidyr)
 
 #2: Separate product code and number      
 refine <- separate(refine, "Product code / number", c("product_code","product_number"), sep = "-") 
refine

 #3: Add product categories

refine$product_category <- ifelse(grepl("p", refine$product_code), "Smartphone", 
       ifelse(grepl("v", refine$product_code), "TV",
           ifelse(grepl("x", refine$product_code), "Laptop",
                  ifelse(grepl("q", refine$product_code), "Tablet", "Other"))))


View(refine)
#4: Add full address for geocoding
   unite(refine, "full_address",address,city,country, sep = ",")
   
   View(refine)
   
#5: Create dummy variables for company and product category
   
   refine$company_phillips <- ifelse(refine$company == "phillips", 1 ,0)
   refine$company_akzo <- ifelse(refine$company == "akzo", 1 ,0)
   refine$company_unilever <- ifelse(refine$company == "unilever", 1 ,0)
   refine$company_vanhouten <- ifelse(refine$company == "van houten", 1 ,0)
  
   refine$product_smartphone <- ifelse(refine$product_category == "Smartphone", 1 ,0)
   refine$product_tv <- ifelse(refine$product_category == "TV", 1 ,0)
   refine$product_laptop <- ifelse(refine$product_category == "Laptop", 1 ,0)
   refine$product_tablet <- ifelse(refine$product_category == "Tablet", 1 ,0)
   