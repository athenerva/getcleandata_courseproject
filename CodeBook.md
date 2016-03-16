---
title: "CodeBook.md"
author: "GS"
date: "March 15, 2016"
output: html_document
---
Step 1: Merge data sets from train and test data. Append subject and activity columns. New data frame called "merged_df" is created with 10,299 observations and 563 variables.


```r
names(merged_df)
```

```
##   [1] "subject"                             
##   [2] "activity_code"                       
##   [3] "tBodyAcc-mean()-X"                   
##   [4] "tBodyAcc-mean()-Y"                   
##   [5] "tBodyAcc-mean()-Z"                   
##   [6] "tBodyAcc-std()-X"                    
##   [7] "tBodyAcc-std()-Y"                    
##   [8] "tBodyAcc-std()-Z"                    
##   [9] "tBodyAcc-mad()-X"                    
##  [10] "tBodyAcc-mad()-Y"                    
##  [11] "tBodyAcc-mad()-Z"                    
##  [12] "tBodyAcc-max()-X"                    
##  [13] "tBodyAcc-max()-Y"                    
##  [14] "tBodyAcc-max()-Z"                    
##  [15] "tBodyAcc-min()-X"                    
##  [16] "tBodyAcc-min()-Y"                    
##  [17] "tBodyAcc-min()-Z"                    
##  [18] "tBodyAcc-sma()"                      
##  [19] "tBodyAcc-energy()-X"                 
##  [20] "tBodyAcc-energy()-Y"                 
##  [21] "tBodyAcc-energy()-Z"                 
##  [22] "tBodyAcc-iqr()-X"                    
##  [23] "tBodyAcc-iqr()-Y"                    
##  [24] "tBodyAcc-iqr()-Z"                    
##  [25] "tBodyAcc-entropy()-X"                
##  [26] "tBodyAcc-entropy()-Y"                
##  [27] "tBodyAcc-entropy()-Z"                
##  [28] "tBodyAcc-arCoeff()-X,1"              
##  [29] "tBodyAcc-arCoeff()-X,2"              
##  [30] "tBodyAcc-arCoeff()-X,3"              
##  [31] "tBodyAcc-arCoeff()-X,4"              
##  [32] "tBodyAcc-arCoeff()-Y,1"              
##  [33] "tBodyAcc-arCoeff()-Y,2"              
##  [34] "tBodyAcc-arCoeff()-Y,3"              
##  [35] "tBodyAcc-arCoeff()-Y,4"              
##  [36] "tBodyAcc-arCoeff()-Z,1"              
##  [37] "tBodyAcc-arCoeff()-Z,2"              
##  [38] "tBodyAcc-arCoeff()-Z,3"              
##  [39] "tBodyAcc-arCoeff()-Z,4"              
##  [40] "tBodyAcc-correlation()-X,Y"          
##  [41] "tBodyAcc-correlation()-X,Z"          
##  [42] "tBodyAcc-correlation()-Y,Z"          
##  [43] "tGravityAcc-mean()-X"                
##  [44] "tGravityAcc-mean()-Y"                
##  [45] "tGravityAcc-mean()-Z"                
##  [46] "tGravityAcc-std()-X"                 
##  [47] "tGravityAcc-std()-Y"                 
##  [48] "tGravityAcc-std()-Z"                 
##  [49] "tGravityAcc-mad()-X"                 
##  [50] "tGravityAcc-mad()-Y"                 
##  [51] "tGravityAcc-mad()-Z"                 
##  [52] "tGravityAcc-max()-X"                 
##  [53] "tGravityAcc-max()-Y"                 
##  [54] "tGravityAcc-max()-Z"                 
##  [55] "tGravityAcc-min()-X"                 
##  [56] "tGravityAcc-min()-Y"                 
##  [57] "tGravityAcc-min()-Z"                 
##  [58] "tGravityAcc-sma()"                   
##  [59] "tGravityAcc-energy()-X"              
##  [60] "tGravityAcc-energy()-Y"              
##  [61] "tGravityAcc-energy()-Z"              
##  [62] "tGravityAcc-iqr()-X"                 
##  [63] "tGravityAcc-iqr()-Y"                 
##  [64] "tGravityAcc-iqr()-Z"                 
##  [65] "tGravityAcc-entropy()-X"             
##  [66] "tGravityAcc-entropy()-Y"             
##  [67] "tGravityAcc-entropy()-Z"             
##  [68] "tGravityAcc-arCoeff()-X,1"           
##  [69] "tGravityAcc-arCoeff()-X,2"           
##  [70] "tGravityAcc-arCoeff()-X,3"           
##  [71] "tGravityAcc-arCoeff()-X,4"           
##  [72] "tGravityAcc-arCoeff()-Y,1"           
##  [73] "tGravityAcc-arCoeff()-Y,2"           
##  [74] "tGravityAcc-arCoeff()-Y,3"           
##  [75] "tGravityAcc-arCoeff()-Y,4"           
##  [76] "tGravityAcc-arCoeff()-Z,1"           
##  [77] "tGravityAcc-arCoeff()-Z,2"           
##  [78] "tGravityAcc-arCoeff()-Z,3"           
##  [79] "tGravityAcc-arCoeff()-Z,4"           
##  [80] "tGravityAcc-correlation()-X,Y"       
##  [81] "tGravityAcc-correlation()-X,Z"       
##  [82] "tGravityAcc-correlation()-Y,Z"       
##  [83] "tBodyAccJerk-mean()-X"               
##  [84] "tBodyAccJerk-mean()-Y"               
##  [85] "tBodyAccJerk-mean()-Z"               
##  [86] "tBodyAccJerk-std()-X"                
##  [87] "tBodyAccJerk-std()-Y"                
##  [88] "tBodyAccJerk-std()-Z"                
##  [89] "tBodyAccJerk-mad()-X"                
##  [90] "tBodyAccJerk-mad()-Y"                
##  [91] "tBodyAccJerk-mad()-Z"                
##  [92] "tBodyAccJerk-max()-X"                
##  [93] "tBodyAccJerk-max()-Y"                
##  [94] "tBodyAccJerk-max()-Z"                
##  [95] "tBodyAccJerk-min()-X"                
##  [96] "tBodyAccJerk-min()-Y"                
##  [97] "tBodyAccJerk-min()-Z"                
##  [98] "tBodyAccJerk-sma()"                  
##  [99] "tBodyAccJerk-energy()-X"             
## [100] "tBodyAccJerk-energy()-Y"             
## [101] "tBodyAccJerk-energy()-Z"             
## [102] "tBodyAccJerk-iqr()-X"                
## [103] "tBodyAccJerk-iqr()-Y"                
## [104] "tBodyAccJerk-iqr()-Z"                
## [105] "tBodyAccJerk-entropy()-X"            
## [106] "tBodyAccJerk-entropy()-Y"            
## [107] "tBodyAccJerk-entropy()-Z"            
## [108] "tBodyAccJerk-arCoeff()-X,1"          
## [109] "tBodyAccJerk-arCoeff()-X,2"          
## [110] "tBodyAccJerk-arCoeff()-X,3"          
## [111] "tBodyAccJerk-arCoeff()-X,4"          
## [112] "tBodyAccJerk-arCoeff()-Y,1"          
## [113] "tBodyAccJerk-arCoeff()-Y,2"          
## [114] "tBodyAccJerk-arCoeff()-Y,3"          
## [115] "tBodyAccJerk-arCoeff()-Y,4"          
## [116] "tBodyAccJerk-arCoeff()-Z,1"          
## [117] "tBodyAccJerk-arCoeff()-Z,2"          
## [118] "tBodyAccJerk-arCoeff()-Z,3"          
## [119] "tBodyAccJerk-arCoeff()-Z,4"          
## [120] "tBodyAccJerk-correlation()-X,Y"      
## [121] "tBodyAccJerk-correlation()-X,Z"      
## [122] "tBodyAccJerk-correlation()-Y,Z"      
## [123] "tBodyGyro-mean()-X"                  
## [124] "tBodyGyro-mean()-Y"                  
## [125] "tBodyGyro-mean()-Z"                  
## [126] "tBodyGyro-std()-X"                   
## [127] "tBodyGyro-std()-Y"                   
## [128] "tBodyGyro-std()-Z"                   
## [129] "tBodyGyro-mad()-X"                   
## [130] "tBodyGyro-mad()-Y"                   
## [131] "tBodyGyro-mad()-Z"                   
## [132] "tBodyGyro-max()-X"                   
## [133] "tBodyGyro-max()-Y"                   
## [134] "tBodyGyro-max()-Z"                   
## [135] "tBodyGyro-min()-X"                   
## [136] "tBodyGyro-min()-Y"                   
## [137] "tBodyGyro-min()-Z"                   
## [138] "tBodyGyro-sma()"                     
## [139] "tBodyGyro-energy()-X"                
## [140] "tBodyGyro-energy()-Y"                
## [141] "tBodyGyro-energy()-Z"                
## [142] "tBodyGyro-iqr()-X"                   
## [143] "tBodyGyro-iqr()-Y"                   
## [144] "tBodyGyro-iqr()-Z"                   
## [145] "tBodyGyro-entropy()-X"               
## [146] "tBodyGyro-entropy()-Y"               
## [147] "tBodyGyro-entropy()-Z"               
## [148] "tBodyGyro-arCoeff()-X,1"             
## [149] "tBodyGyro-arCoeff()-X,2"             
## [150] "tBodyGyro-arCoeff()-X,3"             
## [151] "tBodyGyro-arCoeff()-X,4"             
## [152] "tBodyGyro-arCoeff()-Y,1"             
## [153] "tBodyGyro-arCoeff()-Y,2"             
## [154] "tBodyGyro-arCoeff()-Y,3"             
## [155] "tBodyGyro-arCoeff()-Y,4"             
## [156] "tBodyGyro-arCoeff()-Z,1"             
## [157] "tBodyGyro-arCoeff()-Z,2"             
## [158] "tBodyGyro-arCoeff()-Z,3"             
## [159] "tBodyGyro-arCoeff()-Z,4"             
## [160] "tBodyGyro-correlation()-X,Y"         
## [161] "tBodyGyro-correlation()-X,Z"         
## [162] "tBodyGyro-correlation()-Y,Z"         
## [163] "tBodyGyroJerk-mean()-X"              
## [164] "tBodyGyroJerk-mean()-Y"              
## [165] "tBodyGyroJerk-mean()-Z"              
## [166] "tBodyGyroJerk-std()-X"               
## [167] "tBodyGyroJerk-std()-Y"               
## [168] "tBodyGyroJerk-std()-Z"               
## [169] "tBodyGyroJerk-mad()-X"               
## [170] "tBodyGyroJerk-mad()-Y"               
## [171] "tBodyGyroJerk-mad()-Z"               
## [172] "tBodyGyroJerk-max()-X"               
## [173] "tBodyGyroJerk-max()-Y"               
## [174] "tBodyGyroJerk-max()-Z"               
## [175] "tBodyGyroJerk-min()-X"               
## [176] "tBodyGyroJerk-min()-Y"               
## [177] "tBodyGyroJerk-min()-Z"               
## [178] "tBodyGyroJerk-sma()"                 
## [179] "tBodyGyroJerk-energy()-X"            
## [180] "tBodyGyroJerk-energy()-Y"            
## [181] "tBodyGyroJerk-energy()-Z"            
## [182] "tBodyGyroJerk-iqr()-X"               
## [183] "tBodyGyroJerk-iqr()-Y"               
## [184] "tBodyGyroJerk-iqr()-Z"               
## [185] "tBodyGyroJerk-entropy()-X"           
## [186] "tBodyGyroJerk-entropy()-Y"           
## [187] "tBodyGyroJerk-entropy()-Z"           
## [188] "tBodyGyroJerk-arCoeff()-X,1"         
## [189] "tBodyGyroJerk-arCoeff()-X,2"         
## [190] "tBodyGyroJerk-arCoeff()-X,3"         
## [191] "tBodyGyroJerk-arCoeff()-X,4"         
## [192] "tBodyGyroJerk-arCoeff()-Y,1"         
## [193] "tBodyGyroJerk-arCoeff()-Y,2"         
## [194] "tBodyGyroJerk-arCoeff()-Y,3"         
## [195] "tBodyGyroJerk-arCoeff()-Y,4"         
## [196] "tBodyGyroJerk-arCoeff()-Z,1"         
## [197] "tBodyGyroJerk-arCoeff()-Z,2"         
## [198] "tBodyGyroJerk-arCoeff()-Z,3"         
## [199] "tBodyGyroJerk-arCoeff()-Z,4"         
## [200] "tBodyGyroJerk-correlation()-X,Y"     
## [201] "tBodyGyroJerk-correlation()-X,Z"     
## [202] "tBodyGyroJerk-correlation()-Y,Z"     
## [203] "tBodyAccMag-mean()"                  
## [204] "tBodyAccMag-std()"                   
## [205] "tBodyAccMag-mad()"                   
## [206] "tBodyAccMag-max()"                   
## [207] "tBodyAccMag-min()"                   
## [208] "tBodyAccMag-sma()"                   
## [209] "tBodyAccMag-energy()"                
## [210] "tBodyAccMag-iqr()"                   
## [211] "tBodyAccMag-entropy()"               
## [212] "tBodyAccMag-arCoeff()1"              
## [213] "tBodyAccMag-arCoeff()2"              
## [214] "tBodyAccMag-arCoeff()3"              
## [215] "tBodyAccMag-arCoeff()4"              
## [216] "tGravityAccMag-mean()"               
## [217] "tGravityAccMag-std()"                
## [218] "tGravityAccMag-mad()"                
## [219] "tGravityAccMag-max()"                
## [220] "tGravityAccMag-min()"                
## [221] "tGravityAccMag-sma()"                
## [222] "tGravityAccMag-energy()"             
## [223] "tGravityAccMag-iqr()"                
## [224] "tGravityAccMag-entropy()"            
## [225] "tGravityAccMag-arCoeff()1"           
## [226] "tGravityAccMag-arCoeff()2"           
## [227] "tGravityAccMag-arCoeff()3"           
## [228] "tGravityAccMag-arCoeff()4"           
## [229] "tBodyAccJerkMag-mean()"              
## [230] "tBodyAccJerkMag-std()"               
## [231] "tBodyAccJerkMag-mad()"               
## [232] "tBodyAccJerkMag-max()"               
## [233] "tBodyAccJerkMag-min()"               
## [234] "tBodyAccJerkMag-sma()"               
## [235] "tBodyAccJerkMag-energy()"            
## [236] "tBodyAccJerkMag-iqr()"               
## [237] "tBodyAccJerkMag-entropy()"           
## [238] "tBodyAccJerkMag-arCoeff()1"          
## [239] "tBodyAccJerkMag-arCoeff()2"          
## [240] "tBodyAccJerkMag-arCoeff()3"          
## [241] "tBodyAccJerkMag-arCoeff()4"          
## [242] "tBodyGyroMag-mean()"                 
## [243] "tBodyGyroMag-std()"                  
## [244] "tBodyGyroMag-mad()"                  
## [245] "tBodyGyroMag-max()"                  
## [246] "tBodyGyroMag-min()"                  
## [247] "tBodyGyroMag-sma()"                  
## [248] "tBodyGyroMag-energy()"               
## [249] "tBodyGyroMag-iqr()"                  
## [250] "tBodyGyroMag-entropy()"              
## [251] "tBodyGyroMag-arCoeff()1"             
## [252] "tBodyGyroMag-arCoeff()2"             
## [253] "tBodyGyroMag-arCoeff()3"             
## [254] "tBodyGyroMag-arCoeff()4"             
## [255] "tBodyGyroJerkMag-mean()"             
## [256] "tBodyGyroJerkMag-std()"              
## [257] "tBodyGyroJerkMag-mad()"              
## [258] "tBodyGyroJerkMag-max()"              
## [259] "tBodyGyroJerkMag-min()"              
## [260] "tBodyGyroJerkMag-sma()"              
## [261] "tBodyGyroJerkMag-energy()"           
## [262] "tBodyGyroJerkMag-iqr()"              
## [263] "tBodyGyroJerkMag-entropy()"          
## [264] "tBodyGyroJerkMag-arCoeff()1"         
## [265] "tBodyGyroJerkMag-arCoeff()2"         
## [266] "tBodyGyroJerkMag-arCoeff()3"         
## [267] "tBodyGyroJerkMag-arCoeff()4"         
## [268] "fBodyAcc-mean()-X"                   
## [269] "fBodyAcc-mean()-Y"                   
## [270] "fBodyAcc-mean()-Z"                   
## [271] "fBodyAcc-std()-X"                    
## [272] "fBodyAcc-std()-Y"                    
## [273] "fBodyAcc-std()-Z"                    
## [274] "fBodyAcc-mad()-X"                    
## [275] "fBodyAcc-mad()-Y"                    
## [276] "fBodyAcc-mad()-Z"                    
## [277] "fBodyAcc-max()-X"                    
## [278] "fBodyAcc-max()-Y"                    
## [279] "fBodyAcc-max()-Z"                    
## [280] "fBodyAcc-min()-X"                    
## [281] "fBodyAcc-min()-Y"                    
## [282] "fBodyAcc-min()-Z"                    
## [283] "fBodyAcc-sma()"                      
## [284] "fBodyAcc-energy()-X"                 
## [285] "fBodyAcc-energy()-Y"                 
## [286] "fBodyAcc-energy()-Z"                 
## [287] "fBodyAcc-iqr()-X"                    
## [288] "fBodyAcc-iqr()-Y"                    
## [289] "fBodyAcc-iqr()-Z"                    
## [290] "fBodyAcc-entropy()-X"                
## [291] "fBodyAcc-entropy()-Y"                
## [292] "fBodyAcc-entropy()-Z"                
## [293] "fBodyAcc-maxInds-X"                  
## [294] "fBodyAcc-maxInds-Y"                  
## [295] "fBodyAcc-maxInds-Z"                  
## [296] "fBodyAcc-meanFreq()-X"               
## [297] "fBodyAcc-meanFreq()-Y"               
## [298] "fBodyAcc-meanFreq()-Z"               
## [299] "fBodyAcc-skewness()-X"               
## [300] "fBodyAcc-kurtosis()-X"               
## [301] "fBodyAcc-skewness()-Y"               
## [302] "fBodyAcc-kurtosis()-Y"               
## [303] "fBodyAcc-skewness()-Z"               
## [304] "fBodyAcc-kurtosis()-Z"               
## [305] "fBodyAcc-bandsEnergy()-1,8"          
## [306] "fBodyAcc-bandsEnergy()-9,16"         
## [307] "fBodyAcc-bandsEnergy()-17,24"        
## [308] "fBodyAcc-bandsEnergy()-25,32"        
## [309] "fBodyAcc-bandsEnergy()-33,40"        
## [310] "fBodyAcc-bandsEnergy()-41,48"        
## [311] "fBodyAcc-bandsEnergy()-49,56"        
## [312] "fBodyAcc-bandsEnergy()-57,64"        
## [313] "fBodyAcc-bandsEnergy()-1,16"         
## [314] "fBodyAcc-bandsEnergy()-17,32"        
## [315] "fBodyAcc-bandsEnergy()-33,48"        
## [316] "fBodyAcc-bandsEnergy()-49,64"        
## [317] "fBodyAcc-bandsEnergy()-1,24"         
## [318] "fBodyAcc-bandsEnergy()-25,48"        
## [319] "fBodyAcc-bandsEnergy()-1,8"          
## [320] "fBodyAcc-bandsEnergy()-9,16"         
## [321] "fBodyAcc-bandsEnergy()-17,24"        
## [322] "fBodyAcc-bandsEnergy()-25,32"        
## [323] "fBodyAcc-bandsEnergy()-33,40"        
## [324] "fBodyAcc-bandsEnergy()-41,48"        
## [325] "fBodyAcc-bandsEnergy()-49,56"        
## [326] "fBodyAcc-bandsEnergy()-57,64"        
## [327] "fBodyAcc-bandsEnergy()-1,16"         
## [328] "fBodyAcc-bandsEnergy()-17,32"        
## [329] "fBodyAcc-bandsEnergy()-33,48"        
## [330] "fBodyAcc-bandsEnergy()-49,64"        
## [331] "fBodyAcc-bandsEnergy()-1,24"         
## [332] "fBodyAcc-bandsEnergy()-25,48"        
## [333] "fBodyAcc-bandsEnergy()-1,8"          
## [334] "fBodyAcc-bandsEnergy()-9,16"         
## [335] "fBodyAcc-bandsEnergy()-17,24"        
## [336] "fBodyAcc-bandsEnergy()-25,32"        
## [337] "fBodyAcc-bandsEnergy()-33,40"        
## [338] "fBodyAcc-bandsEnergy()-41,48"        
## [339] "fBodyAcc-bandsEnergy()-49,56"        
## [340] "fBodyAcc-bandsEnergy()-57,64"        
## [341] "fBodyAcc-bandsEnergy()-1,16"         
## [342] "fBodyAcc-bandsEnergy()-17,32"        
## [343] "fBodyAcc-bandsEnergy()-33,48"        
## [344] "fBodyAcc-bandsEnergy()-49,64"        
## [345] "fBodyAcc-bandsEnergy()-1,24"         
## [346] "fBodyAcc-bandsEnergy()-25,48"        
## [347] "fBodyAccJerk-mean()-X"               
## [348] "fBodyAccJerk-mean()-Y"               
## [349] "fBodyAccJerk-mean()-Z"               
## [350] "fBodyAccJerk-std()-X"                
## [351] "fBodyAccJerk-std()-Y"                
## [352] "fBodyAccJerk-std()-Z"                
## [353] "fBodyAccJerk-mad()-X"                
## [354] "fBodyAccJerk-mad()-Y"                
## [355] "fBodyAccJerk-mad()-Z"                
## [356] "fBodyAccJerk-max()-X"                
## [357] "fBodyAccJerk-max()-Y"                
## [358] "fBodyAccJerk-max()-Z"                
## [359] "fBodyAccJerk-min()-X"                
## [360] "fBodyAccJerk-min()-Y"                
## [361] "fBodyAccJerk-min()-Z"                
## [362] "fBodyAccJerk-sma()"                  
## [363] "fBodyAccJerk-energy()-X"             
## [364] "fBodyAccJerk-energy()-Y"             
## [365] "fBodyAccJerk-energy()-Z"             
## [366] "fBodyAccJerk-iqr()-X"                
## [367] "fBodyAccJerk-iqr()-Y"                
## [368] "fBodyAccJerk-iqr()-Z"                
## [369] "fBodyAccJerk-entropy()-X"            
## [370] "fBodyAccJerk-entropy()-Y"            
## [371] "fBodyAccJerk-entropy()-Z"            
## [372] "fBodyAccJerk-maxInds-X"              
## [373] "fBodyAccJerk-maxInds-Y"              
## [374] "fBodyAccJerk-maxInds-Z"              
## [375] "fBodyAccJerk-meanFreq()-X"           
## [376] "fBodyAccJerk-meanFreq()-Y"           
## [377] "fBodyAccJerk-meanFreq()-Z"           
## [378] "fBodyAccJerk-skewness()-X"           
## [379] "fBodyAccJerk-kurtosis()-X"           
## [380] "fBodyAccJerk-skewness()-Y"           
## [381] "fBodyAccJerk-kurtosis()-Y"           
## [382] "fBodyAccJerk-skewness()-Z"           
## [383] "fBodyAccJerk-kurtosis()-Z"           
## [384] "fBodyAccJerk-bandsEnergy()-1,8"      
## [385] "fBodyAccJerk-bandsEnergy()-9,16"     
## [386] "fBodyAccJerk-bandsEnergy()-17,24"    
## [387] "fBodyAccJerk-bandsEnergy()-25,32"    
## [388] "fBodyAccJerk-bandsEnergy()-33,40"    
## [389] "fBodyAccJerk-bandsEnergy()-41,48"    
## [390] "fBodyAccJerk-bandsEnergy()-49,56"    
## [391] "fBodyAccJerk-bandsEnergy()-57,64"    
## [392] "fBodyAccJerk-bandsEnergy()-1,16"     
## [393] "fBodyAccJerk-bandsEnergy()-17,32"    
## [394] "fBodyAccJerk-bandsEnergy()-33,48"    
## [395] "fBodyAccJerk-bandsEnergy()-49,64"    
## [396] "fBodyAccJerk-bandsEnergy()-1,24"     
## [397] "fBodyAccJerk-bandsEnergy()-25,48"    
## [398] "fBodyAccJerk-bandsEnergy()-1,8"      
## [399] "fBodyAccJerk-bandsEnergy()-9,16"     
## [400] "fBodyAccJerk-bandsEnergy()-17,24"    
## [401] "fBodyAccJerk-bandsEnergy()-25,32"    
## [402] "fBodyAccJerk-bandsEnergy()-33,40"    
## [403] "fBodyAccJerk-bandsEnergy()-41,48"    
## [404] "fBodyAccJerk-bandsEnergy()-49,56"    
## [405] "fBodyAccJerk-bandsEnergy()-57,64"    
## [406] "fBodyAccJerk-bandsEnergy()-1,16"     
## [407] "fBodyAccJerk-bandsEnergy()-17,32"    
## [408] "fBodyAccJerk-bandsEnergy()-33,48"    
## [409] "fBodyAccJerk-bandsEnergy()-49,64"    
## [410] "fBodyAccJerk-bandsEnergy()-1,24"     
## [411] "fBodyAccJerk-bandsEnergy()-25,48"    
## [412] "fBodyAccJerk-bandsEnergy()-1,8"      
## [413] "fBodyAccJerk-bandsEnergy()-9,16"     
## [414] "fBodyAccJerk-bandsEnergy()-17,24"    
## [415] "fBodyAccJerk-bandsEnergy()-25,32"    
## [416] "fBodyAccJerk-bandsEnergy()-33,40"    
## [417] "fBodyAccJerk-bandsEnergy()-41,48"    
## [418] "fBodyAccJerk-bandsEnergy()-49,56"    
## [419] "fBodyAccJerk-bandsEnergy()-57,64"    
## [420] "fBodyAccJerk-bandsEnergy()-1,16"     
## [421] "fBodyAccJerk-bandsEnergy()-17,32"    
## [422] "fBodyAccJerk-bandsEnergy()-33,48"    
## [423] "fBodyAccJerk-bandsEnergy()-49,64"    
## [424] "fBodyAccJerk-bandsEnergy()-1,24"     
## [425] "fBodyAccJerk-bandsEnergy()-25,48"    
## [426] "fBodyGyro-mean()-X"                  
## [427] "fBodyGyro-mean()-Y"                  
## [428] "fBodyGyro-mean()-Z"                  
## [429] "fBodyGyro-std()-X"                   
## [430] "fBodyGyro-std()-Y"                   
## [431] "fBodyGyro-std()-Z"                   
## [432] "fBodyGyro-mad()-X"                   
## [433] "fBodyGyro-mad()-Y"                   
## [434] "fBodyGyro-mad()-Z"                   
## [435] "fBodyGyro-max()-X"                   
## [436] "fBodyGyro-max()-Y"                   
## [437] "fBodyGyro-max()-Z"                   
## [438] "fBodyGyro-min()-X"                   
## [439] "fBodyGyro-min()-Y"                   
## [440] "fBodyGyro-min()-Z"                   
## [441] "fBodyGyro-sma()"                     
## [442] "fBodyGyro-energy()-X"                
## [443] "fBodyGyro-energy()-Y"                
## [444] "fBodyGyro-energy()-Z"                
## [445] "fBodyGyro-iqr()-X"                   
## [446] "fBodyGyro-iqr()-Y"                   
## [447] "fBodyGyro-iqr()-Z"                   
## [448] "fBodyGyro-entropy()-X"               
## [449] "fBodyGyro-entropy()-Y"               
## [450] "fBodyGyro-entropy()-Z"               
## [451] "fBodyGyro-maxInds-X"                 
## [452] "fBodyGyro-maxInds-Y"                 
## [453] "fBodyGyro-maxInds-Z"                 
## [454] "fBodyGyro-meanFreq()-X"              
## [455] "fBodyGyro-meanFreq()-Y"              
## [456] "fBodyGyro-meanFreq()-Z"              
## [457] "fBodyGyro-skewness()-X"              
## [458] "fBodyGyro-kurtosis()-X"              
## [459] "fBodyGyro-skewness()-Y"              
## [460] "fBodyGyro-kurtosis()-Y"              
## [461] "fBodyGyro-skewness()-Z"              
## [462] "fBodyGyro-kurtosis()-Z"              
## [463] "fBodyGyro-bandsEnergy()-1,8"         
## [464] "fBodyGyro-bandsEnergy()-9,16"        
## [465] "fBodyGyro-bandsEnergy()-17,24"       
## [466] "fBodyGyro-bandsEnergy()-25,32"       
## [467] "fBodyGyro-bandsEnergy()-33,40"       
## [468] "fBodyGyro-bandsEnergy()-41,48"       
## [469] "fBodyGyro-bandsEnergy()-49,56"       
## [470] "fBodyGyro-bandsEnergy()-57,64"       
## [471] "fBodyGyro-bandsEnergy()-1,16"        
## [472] "fBodyGyro-bandsEnergy()-17,32"       
## [473] "fBodyGyro-bandsEnergy()-33,48"       
## [474] "fBodyGyro-bandsEnergy()-49,64"       
## [475] "fBodyGyro-bandsEnergy()-1,24"        
## [476] "fBodyGyro-bandsEnergy()-25,48"       
## [477] "fBodyGyro-bandsEnergy()-1,8"         
## [478] "fBodyGyro-bandsEnergy()-9,16"        
## [479] "fBodyGyro-bandsEnergy()-17,24"       
## [480] "fBodyGyro-bandsEnergy()-25,32"       
## [481] "fBodyGyro-bandsEnergy()-33,40"       
## [482] "fBodyGyro-bandsEnergy()-41,48"       
## [483] "fBodyGyro-bandsEnergy()-49,56"       
## [484] "fBodyGyro-bandsEnergy()-57,64"       
## [485] "fBodyGyro-bandsEnergy()-1,16"        
## [486] "fBodyGyro-bandsEnergy()-17,32"       
## [487] "fBodyGyro-bandsEnergy()-33,48"       
## [488] "fBodyGyro-bandsEnergy()-49,64"       
## [489] "fBodyGyro-bandsEnergy()-1,24"        
## [490] "fBodyGyro-bandsEnergy()-25,48"       
## [491] "fBodyGyro-bandsEnergy()-1,8"         
## [492] "fBodyGyro-bandsEnergy()-9,16"        
## [493] "fBodyGyro-bandsEnergy()-17,24"       
## [494] "fBodyGyro-bandsEnergy()-25,32"       
## [495] "fBodyGyro-bandsEnergy()-33,40"       
## [496] "fBodyGyro-bandsEnergy()-41,48"       
## [497] "fBodyGyro-bandsEnergy()-49,56"       
## [498] "fBodyGyro-bandsEnergy()-57,64"       
## [499] "fBodyGyro-bandsEnergy()-1,16"        
## [500] "fBodyGyro-bandsEnergy()-17,32"       
## [501] "fBodyGyro-bandsEnergy()-33,48"       
## [502] "fBodyGyro-bandsEnergy()-49,64"       
## [503] "fBodyGyro-bandsEnergy()-1,24"        
## [504] "fBodyGyro-bandsEnergy()-25,48"       
## [505] "fBodyAccMag-mean()"                  
## [506] "fBodyAccMag-std()"                   
## [507] "fBodyAccMag-mad()"                   
## [508] "fBodyAccMag-max()"                   
## [509] "fBodyAccMag-min()"                   
## [510] "fBodyAccMag-sma()"                   
## [511] "fBodyAccMag-energy()"                
## [512] "fBodyAccMag-iqr()"                   
## [513] "fBodyAccMag-entropy()"               
## [514] "fBodyAccMag-maxInds"                 
## [515] "fBodyAccMag-meanFreq()"              
## [516] "fBodyAccMag-skewness()"              
## [517] "fBodyAccMag-kurtosis()"              
## [518] "fBodyBodyAccJerkMag-mean()"          
## [519] "fBodyBodyAccJerkMag-std()"           
## [520] "fBodyBodyAccJerkMag-mad()"           
## [521] "fBodyBodyAccJerkMag-max()"           
## [522] "fBodyBodyAccJerkMag-min()"           
## [523] "fBodyBodyAccJerkMag-sma()"           
## [524] "fBodyBodyAccJerkMag-energy()"        
## [525] "fBodyBodyAccJerkMag-iqr()"           
## [526] "fBodyBodyAccJerkMag-entropy()"       
## [527] "fBodyBodyAccJerkMag-maxInds"         
## [528] "fBodyBodyAccJerkMag-meanFreq()"      
## [529] "fBodyBodyAccJerkMag-skewness()"      
## [530] "fBodyBodyAccJerkMag-kurtosis()"      
## [531] "fBodyBodyGyroMag-mean()"             
## [532] "fBodyBodyGyroMag-std()"              
## [533] "fBodyBodyGyroMag-mad()"              
## [534] "fBodyBodyGyroMag-max()"              
## [535] "fBodyBodyGyroMag-min()"              
## [536] "fBodyBodyGyroMag-sma()"              
## [537] "fBodyBodyGyroMag-energy()"           
## [538] "fBodyBodyGyroMag-iqr()"              
## [539] "fBodyBodyGyroMag-entropy()"          
## [540] "fBodyBodyGyroMag-maxInds"            
## [541] "fBodyBodyGyroMag-meanFreq()"         
## [542] "fBodyBodyGyroMag-skewness()"         
## [543] "fBodyBodyGyroMag-kurtosis()"         
## [544] "fBodyBodyGyroJerkMag-mean()"         
## [545] "fBodyBodyGyroJerkMag-std()"          
## [546] "fBodyBodyGyroJerkMag-mad()"          
## [547] "fBodyBodyGyroJerkMag-max()"          
## [548] "fBodyBodyGyroJerkMag-min()"          
## [549] "fBodyBodyGyroJerkMag-sma()"          
## [550] "fBodyBodyGyroJerkMag-energy()"       
## [551] "fBodyBodyGyroJerkMag-iqr()"          
## [552] "fBodyBodyGyroJerkMag-entropy()"      
## [553] "fBodyBodyGyroJerkMag-maxInds"        
## [554] "fBodyBodyGyroJerkMag-meanFreq()"     
## [555] "fBodyBodyGyroJerkMag-skewness()"     
## [556] "fBodyBodyGyroJerkMag-kurtosis()"     
## [557] "angle(tBodyAccMean,gravity)"         
## [558] "angle(tBodyAccJerkMean),gravityMean)"
## [559] "angle(tBodyGyroMean,gravityMean)"    
## [560] "angle(tBodyGyroJerkMean,gravityMean)"
## [561] "angle(X,gravityMean)"                
## [562] "angle(Y,gravityMean)"                
## [563] "angle(Z,gravityMean)"
```

Step 2: Extract feature columns with only mean and std deviation measurements


```r
summary(subset_df)
```

```
##     subject      activity_code      mean_tBodyAcc_X   mean_tBodyAcc_Y   
##  Min.   : 1.00   Length:10299       Min.   :-1.0000   Min.   :-1.00000  
##  1st Qu.: 9.00   Class :character   1st Qu.: 0.2626   1st Qu.:-0.02490  
##  Median :17.00   Mode  :character   Median : 0.2772   Median :-0.01716  
##  Mean   :16.15                      Mean   : 0.2743   Mean   :-0.01774  
##  3rd Qu.:24.00                      3rd Qu.: 0.2884   3rd Qu.:-0.01062  
##  Max.   :30.00                      Max.   : 1.0000   Max.   : 1.00000  
##  mean_tBodyAcc_Z    mean_tGravityAcc_X mean_tGravityAcc_Y 
##  Min.   :-1.00000   Min.   :-1.0000    Min.   :-1.000000  
##  1st Qu.:-0.12102   1st Qu.: 0.8117    1st Qu.:-0.242943  
##  Median :-0.10860   Median : 0.9218    Median :-0.143551  
##  Mean   :-0.10892   Mean   : 0.6692    Mean   : 0.004039  
##  3rd Qu.:-0.09759   3rd Qu.: 0.9547    3rd Qu.: 0.118905  
##  Max.   : 1.00000   Max.   : 1.0000    Max.   : 1.000000  
##  mean_tGravityAcc_Z mean_tBodyAccJerk_X mean_tBodyAccJerk_Y
##  Min.   :-1.00000   Min.   :-1.00000    Min.   :-1.000000  
##  1st Qu.:-0.11671   1st Qu.: 0.06298    1st Qu.:-0.018555  
##  Median : 0.03680   Median : 0.07597    Median : 0.010753  
##  Mean   : 0.09215   Mean   : 0.07894    Mean   : 0.007948  
##  3rd Qu.: 0.21621   3rd Qu.: 0.09131    3rd Qu.: 0.033538  
##  Max.   : 1.00000   Max.   : 1.00000    Max.   : 1.000000  
##  mean_tBodyAccJerk_Z mean_tBodyGyro_X   mean_tBodyGyro_Y  
##  Min.   :-1.000000   Min.   :-1.00000   Min.   :-1.00000  
##  1st Qu.:-0.031552   1st Qu.:-0.04579   1st Qu.:-0.10399  
##  Median :-0.001159   Median :-0.02776   Median :-0.07477  
##  Mean   :-0.004675   Mean   :-0.03098   Mean   :-0.07472  
##  3rd Qu.: 0.024578   3rd Qu.:-0.01058   3rd Qu.:-0.05110  
##  Max.   : 1.000000   Max.   : 1.00000   Max.   : 1.00000  
##  mean_tBodyGyro_Z   mean_tBodyGyroJerk_X mean_tBodyGyroJerk_Y
##  Min.   :-1.00000   Min.   :-1.00000     Min.   :-1.00000    
##  1st Qu.: 0.06485   1st Qu.:-0.11723     1st Qu.:-0.05868    
##  Median : 0.08626   Median :-0.09824     Median :-0.04056    
##  Mean   : 0.08836   Mean   :-0.09671     Mean   :-0.04232    
##  3rd Qu.: 0.11044   3rd Qu.:-0.07930     3rd Qu.:-0.02521    
##  Max.   : 1.00000   Max.   : 1.00000     Max.   : 1.00000    
##  mean_tBodyGyroJerk_Z mean_tBodyAccMag  mean_tGravityAccMag
##  Min.   :-1.00000     Min.   :-1.0000   Min.   :-1.0000    
##  1st Qu.:-0.07936     1st Qu.:-0.9819   1st Qu.:-0.9819    
##  Median :-0.05455     Median :-0.8746   Median :-0.8746    
##  Mean   :-0.05483     Mean   :-0.5482   Mean   :-0.5482    
##  3rd Qu.:-0.03168     3rd Qu.:-0.1201   3rd Qu.:-0.1201    
##  Max.   : 1.00000     Max.   : 1.0000   Max.   : 1.0000    
##  mean_tBodyAccJerkMag mean_tBodyGyroMag mean_tBodyGyroJerkMag
##  Min.   :-1.0000      Min.   :-1.0000   Min.   :-1.0000      
##  1st Qu.:-0.9896      1st Qu.:-0.9781   1st Qu.:-0.9923      
##  Median :-0.9481      Median :-0.8223   Median :-0.9559      
##  Mean   :-0.6494      Mean   :-0.6052   Mean   :-0.7621      
##  3rd Qu.:-0.2956      3rd Qu.:-0.2454   3rd Qu.:-0.5499      
##  Max.   : 1.0000      Max.   : 1.0000   Max.   : 1.0000      
##  mean_fBodyAcc_X   mean_fBodyAcc_Y   mean_fBodyAcc_Z   mean_fBodyAccJerk_X
##  Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.0000    
##  1st Qu.:-0.9913   1st Qu.:-0.9792   1st Qu.:-0.9832   1st Qu.:-0.9912    
##  Median :-0.9456   Median :-0.8643   Median :-0.8954   Median :-0.9516    
##  Mean   :-0.6228   Mean   :-0.5375   Mean   :-0.6650   Mean   :-0.6567    
##  3rd Qu.:-0.2646   3rd Qu.:-0.1032   3rd Qu.:-0.3662   3rd Qu.:-0.3270    
##  Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.0000    
##  mean_fBodyAccJerk_Y mean_fBodyAccJerk_Z mean_fBodyGyro_X 
##  Min.   :-1.0000     Min.   :-1.0000     Min.   :-1.0000  
##  1st Qu.:-0.9848     1st Qu.:-0.9873     1st Qu.:-0.9853  
##  Median :-0.9257     Median :-0.9475     Median :-0.8917  
##  Mean   :-0.6290     Mean   :-0.7436     Mean   :-0.6721  
##  3rd Qu.:-0.2638     3rd Qu.:-0.5133     3rd Qu.:-0.3837  
##  Max.   : 1.0000     Max.   : 1.0000     Max.   : 1.0000  
##  mean_fBodyGyro_Y  mean_fBodyGyro_Z  mean_fBodyAccMag 
##  Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.0000  
##  1st Qu.:-0.9847   1st Qu.:-0.9851   1st Qu.:-0.9847  
##  Median :-0.9197   Median :-0.8877   Median :-0.8755  
##  Mean   :-0.7062   Mean   :-0.6442   Mean   :-0.5860  
##  3rd Qu.:-0.4735   3rd Qu.:-0.3225   3rd Qu.:-0.2173  
##  Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.0000  
##  mean_fBodyBodyAccJerkMag mean_fBodyBodyGyroMag mean_fBodyBodyGyroJerkMag
##  Min.   :-1.0000          Min.   :-1.0000       Min.   :-1.0000          
##  1st Qu.:-0.9898          1st Qu.:-0.9825       1st Qu.:-0.9921          
##  Median :-0.9290          Median :-0.8756       Median :-0.9453          
##  Mean   :-0.6208          Mean   :-0.6974       Mean   :-0.7798          
##  3rd Qu.:-0.2600          3rd Qu.:-0.4514       3rd Qu.:-0.6122          
##  Max.   : 1.0000          Max.   : 1.0000       Max.   : 1.0000          
##  std_dev_tBodyAcc_X std_dev_tBodyAcc_Y std_dev_tBodyAcc_Z
##  Min.   :-1.0000    Min.   :-1.00000   Min.   :-1.0000   
##  1st Qu.:-0.9924    1st Qu.:-0.97699   1st Qu.:-0.9791   
##  Median :-0.9430    Median :-0.83503   Median :-0.8508   
##  Mean   :-0.6078    Mean   :-0.51019   Mean   :-0.6131   
##  3rd Qu.:-0.2503    3rd Qu.:-0.05734   3rd Qu.:-0.2787   
##  Max.   : 1.0000    Max.   : 1.00000   Max.   : 1.0000   
##  std_dev_tGravityAcc_X std_dev_tGravityAcc_Y std_dev_tGravityAcc_Z
##  Min.   :-1.0000       Min.   :-1.0000       Min.   :-1.0000      
##  1st Qu.:-0.9949       1st Qu.:-0.9913       1st Qu.:-0.9866      
##  Median :-0.9819       Median :-0.9759       Median :-0.9665      
##  Mean   :-0.9652       Mean   :-0.9544       Mean   :-0.9389      
##  3rd Qu.:-0.9615       3rd Qu.:-0.9464       3rd Qu.:-0.9296      
##  Max.   : 1.0000       Max.   : 1.0000       Max.   : 1.0000      
##  std_dev_tBodyAccJerk_X std_dev_tBodyAccJerk_Y std_dev_tBodyAccJerk_Z
##  Min.   :-1.0000        Min.   :-1.0000        Min.   :-1.0000       
##  1st Qu.:-0.9913        1st Qu.:-0.9850        1st Qu.:-0.9892       
##  Median :-0.9513        Median :-0.9250        Median :-0.9543       
##  Mean   :-0.6398        Mean   :-0.6080        Mean   :-0.7628       
##  3rd Qu.:-0.2912        3rd Qu.:-0.2218        3rd Qu.:-0.5485       
##  Max.   : 1.0000        Max.   : 1.0000        Max.   : 1.0000       
##  std_dev_tBodyGyro_X std_dev_tBodyGyro_Y std_dev_tBodyGyro_Z
##  Min.   :-1.0000     Min.   :-1.0000     Min.   :-1.0000    
##  1st Qu.:-0.9872     1st Qu.:-0.9819     1st Qu.:-0.9850    
##  Median :-0.9016     Median :-0.9106     Median :-0.8819    
##  Mean   :-0.7212     Mean   :-0.6827     Mean   :-0.6537    
##  3rd Qu.:-0.4822     3rd Qu.:-0.4461     3rd Qu.:-0.3379    
##  Max.   : 1.0000     Max.   : 1.0000     Max.   : 1.0000    
##  std_dev_tBodyGyroJerk_X std_dev_tBodyGyroJerk_Y std_dev_tBodyGyroJerk_Z
##  Min.   :-1.0000         Min.   :-1.0000         Min.   :-1.0000        
##  1st Qu.:-0.9907         1st Qu.:-0.9922         1st Qu.:-0.9926        
##  Median :-0.9348         Median :-0.9548         Median :-0.9503        
##  Mean   :-0.7313         Mean   :-0.7861         Mean   :-0.7399        
##  3rd Qu.:-0.4865         3rd Qu.:-0.6268         3rd Qu.:-0.5097        
##  Max.   : 1.0000         Max.   : 1.0000         Max.   : 1.0000        
##  std_dev_tBodyAccMag std_dev_tGravityAccMag std_dev_tBodyAccJerkMag
##  Min.   :-1.0000     Min.   :-1.0000        Min.   :-1.0000        
##  1st Qu.:-0.9822     1st Qu.:-0.9822        1st Qu.:-0.9907        
##  Median :-0.8437     Median :-0.8437        Median :-0.9288        
##  Mean   :-0.5912     Mean   :-0.5912        Mean   :-0.6278        
##  3rd Qu.:-0.2423     3rd Qu.:-0.2423        3rd Qu.:-0.2733        
##  Max.   : 1.0000     Max.   : 1.0000        Max.   : 1.0000        
##  std_dev_tBodyGyroMag std_dev_tBodyGyroJerkMag std_dev_fBodyAcc_X
##  Min.   :-1.0000      Min.   :-1.0000          Min.   :-1.0000   
##  1st Qu.:-0.9775      1st Qu.:-0.9922          1st Qu.:-0.9929   
##  Median :-0.8259      Median :-0.9403          Median :-0.9416   
##  Mean   :-0.6625      Mean   :-0.7780          Mean   :-0.6034   
##  3rd Qu.:-0.3940      3rd Qu.:-0.6093          3rd Qu.:-0.2493   
##  Max.   : 1.0000      Max.   : 1.0000          Max.   : 1.0000   
##  std_dev_fBodyAcc_Y std_dev_fBodyAcc_Z std_dev_fBodyAccJerk_X
##  Min.   :-1.00000   Min.   :-1.0000    Min.   :-1.0000       
##  1st Qu.:-0.97689   1st Qu.:-0.9780    1st Qu.:-0.9920       
##  Median :-0.83261   Median :-0.8398    Median :-0.9562       
##  Mean   :-0.52842   Mean   :-0.6179    Mean   :-0.6550       
##  3rd Qu.:-0.09216   3rd Qu.:-0.3023    3rd Qu.:-0.3203       
##  Max.   : 1.00000   Max.   : 1.0000    Max.   : 1.0000       
##  std_dev_fBodyAccJerk_Y std_dev_fBodyAccJerk_Z std_dev_fBodyGyro_X
##  Min.   :-1.0000        Min.   :-1.0000        Min.   :-1.0000    
##  1st Qu.:-0.9865        1st Qu.:-0.9895        1st Qu.:-0.9881    
##  Median :-0.9280        Median :-0.9590        Median :-0.9053    
##  Mean   :-0.6122        Mean   :-0.7809        Mean   :-0.7386    
##  3rd Qu.:-0.2361        3rd Qu.:-0.5903        3rd Qu.:-0.5225    
##  Max.   : 1.0000        Max.   : 1.0000        Max.   : 1.0000    
##  std_dev_fBodyGyro_Y std_dev_fBodyGyro_Z std_dev_fBodyAccMag
##  Min.   :-1.0000     Min.   :-1.0000     Min.   :-1.0000    
##  1st Qu.:-0.9808     1st Qu.:-0.9862     1st Qu.:-0.9829    
##  Median :-0.9061     Median :-0.8915     Median :-0.8547    
##  Mean   :-0.6742     Mean   :-0.6904     Mean   :-0.6595    
##  3rd Qu.:-0.4385     3rd Qu.:-0.4168     3rd Qu.:-0.3823    
##  Max.   : 1.0000     Max.   : 1.0000     Max.   : 1.0000    
##  std_dev_fBodyBodyAccJerkMag std_dev_fBodyBodyGyroMag
##  Min.   :-1.0000             Min.   :-1.0000         
##  1st Qu.:-0.9907             1st Qu.:-0.9781         
##  Median :-0.9255             Median :-0.8275         
##  Mean   :-0.6401             Mean   :-0.7000         
##  3rd Qu.:-0.3082             3rd Qu.:-0.4713         
##  Max.   : 1.0000             Max.   : 1.0000         
##  std_dev_fBodyBodyGyroJerkMag
##  Min.   :-1.0000             
##  1st Qu.:-0.9926             
##  Median :-0.9382             
##  Mean   :-0.7922             
##  3rd Qu.:-0.6437             
##  Max.   : 1.0000
```

Step 3: Substitute activity code with activity name


```r
str(subset_df$activity_code)
```

```
##  chr [1:10299] "STANDING" "STANDING" "STANDING" "STANDING" ...
```

Step 4: Assign descriptive names to columns


```r
names(subset_df)
```

```
##  [1] "subject"                      "activity_code"               
##  [3] "mean_tBodyAcc_X"              "mean_tBodyAcc_Y"             
##  [5] "mean_tBodyAcc_Z"              "mean_tGravityAcc_X"          
##  [7] "mean_tGravityAcc_Y"           "mean_tGravityAcc_Z"          
##  [9] "mean_tBodyAccJerk_X"          "mean_tBodyAccJerk_Y"         
## [11] "mean_tBodyAccJerk_Z"          "mean_tBodyGyro_X"            
## [13] "mean_tBodyGyro_Y"             "mean_tBodyGyro_Z"            
## [15] "mean_tBodyGyroJerk_X"         "mean_tBodyGyroJerk_Y"        
## [17] "mean_tBodyGyroJerk_Z"         "mean_tBodyAccMag"            
## [19] "mean_tGravityAccMag"          "mean_tBodyAccJerkMag"        
## [21] "mean_tBodyGyroMag"            "mean_tBodyGyroJerkMag"       
## [23] "mean_fBodyAcc_X"              "mean_fBodyAcc_Y"             
## [25] "mean_fBodyAcc_Z"              "mean_fBodyAccJerk_X"         
## [27] "mean_fBodyAccJerk_Y"          "mean_fBodyAccJerk_Z"         
## [29] "mean_fBodyGyro_X"             "mean_fBodyGyro_Y"            
## [31] "mean_fBodyGyro_Z"             "mean_fBodyAccMag"            
## [33] "mean_fBodyBodyAccJerkMag"     "mean_fBodyBodyGyroMag"       
## [35] "mean_fBodyBodyGyroJerkMag"    "std_dev_tBodyAcc_X"          
## [37] "std_dev_tBodyAcc_Y"           "std_dev_tBodyAcc_Z"          
## [39] "std_dev_tGravityAcc_X"        "std_dev_tGravityAcc_Y"       
## [41] "std_dev_tGravityAcc_Z"        "std_dev_tBodyAccJerk_X"      
## [43] "std_dev_tBodyAccJerk_Y"       "std_dev_tBodyAccJerk_Z"      
## [45] "std_dev_tBodyGyro_X"          "std_dev_tBodyGyro_Y"         
## [47] "std_dev_tBodyGyro_Z"          "std_dev_tBodyGyroJerk_X"     
## [49] "std_dev_tBodyGyroJerk_Y"      "std_dev_tBodyGyroJerk_Z"     
## [51] "std_dev_tBodyAccMag"          "std_dev_tGravityAccMag"      
## [53] "std_dev_tBodyAccJerkMag"      "std_dev_tBodyGyroMag"        
## [55] "std_dev_tBodyGyroJerkMag"     "std_dev_fBodyAcc_X"          
## [57] "std_dev_fBodyAcc_Y"           "std_dev_fBodyAcc_Z"          
## [59] "std_dev_fBodyAccJerk_X"       "std_dev_fBodyAccJerk_Y"      
## [61] "std_dev_fBodyAccJerk_Z"       "std_dev_fBodyGyro_X"         
## [63] "std_dev_fBodyGyro_Y"          "std_dev_fBodyGyro_Z"         
## [65] "std_dev_fBodyAccMag"          "std_dev_fBodyBodyAccJerkMag" 
## [67] "std_dev_fBodyBodyGyroMag"     "std_dev_fBodyBodyGyroJerkMag"
```

Step 5: Create new, tidy data set


```r
summary(tidy_df)
```

```
##     subject     activity_code      mean_tBodyAcc_X  mean_tBodyAcc_Y    
##  Min.   : 1.0   Length:180         Min.   :0.2216   Min.   :-0.040514  
##  1st Qu.: 8.0   Class :character   1st Qu.:0.2712   1st Qu.:-0.020022  
##  Median :15.5   Mode  :character   Median :0.2770   Median :-0.017262  
##  Mean   :15.5                      Mean   :0.2743   Mean   :-0.017876  
##  3rd Qu.:23.0                      3rd Qu.:0.2800   3rd Qu.:-0.014936  
##  Max.   :30.0                      Max.   :0.3015   Max.   :-0.001308  
##  mean_tBodyAcc_Z    mean_tGravityAcc_X mean_tGravityAcc_Y
##  Min.   :-0.15251   Min.   :-0.6800    Min.   :-0.47989  
##  1st Qu.:-0.11207   1st Qu.: 0.8376    1st Qu.:-0.23319  
##  Median :-0.10819   Median : 0.9208    Median :-0.12782  
##  Mean   :-0.10916   Mean   : 0.6975    Mean   :-0.01621  
##  3rd Qu.:-0.10443   3rd Qu.: 0.9425    3rd Qu.: 0.08773  
##  Max.   :-0.07538   Max.   : 0.9745    Max.   : 0.95659  
##  mean_tGravityAcc_Z mean_tBodyAccJerk_X mean_tBodyAccJerk_Y 
##  Min.   :-0.49509   Min.   :0.04269     Min.   :-0.0386872  
##  1st Qu.:-0.11726   1st Qu.:0.07396     1st Qu.: 0.0004664  
##  Median : 0.02384   Median :0.07640     Median : 0.0094698  
##  Mean   : 0.07413   Mean   :0.07947     Mean   : 0.0075652  
##  3rd Qu.: 0.14946   3rd Qu.:0.08330     3rd Qu.: 0.0134008  
##  Max.   : 0.95787   Max.   :0.13019     Max.   : 0.0568186  
##  mean_tBodyAccJerk_Z mean_tBodyGyro_X   mean_tBodyGyro_Y  
##  Min.   :-0.067458   Min.   :-0.20578   Min.   :-0.20421  
##  1st Qu.:-0.010601   1st Qu.:-0.04712   1st Qu.:-0.08955  
##  Median :-0.003861   Median :-0.02871   Median :-0.07318  
##  Mean   :-0.004953   Mean   :-0.03244   Mean   :-0.07426  
##  3rd Qu.: 0.001958   3rd Qu.:-0.01676   3rd Qu.:-0.06113  
##  Max.   : 0.038053   Max.   : 0.19270   Max.   : 0.02747  
##  mean_tBodyGyro_Z   mean_tBodyGyroJerk_X mean_tBodyGyroJerk_Y
##  Min.   :-0.07245   Min.   :-0.15721     Min.   :-0.07681    
##  1st Qu.: 0.07475   1st Qu.:-0.10322     1st Qu.:-0.04552    
##  Median : 0.08512   Median :-0.09868     Median :-0.04112    
##  Mean   : 0.08744   Mean   :-0.09606     Mean   :-0.04269    
##  3rd Qu.: 0.10177   3rd Qu.:-0.09110     3rd Qu.:-0.03842    
##  Max.   : 0.17910   Max.   :-0.02209     Max.   :-0.01320    
##  mean_tBodyGyroJerk_Z mean_tBodyAccMag  mean_tGravityAccMag
##  Min.   :-0.092500    Min.   :-0.9865   Min.   :-0.9865    
##  1st Qu.:-0.061725    1st Qu.:-0.9573   1st Qu.:-0.9573    
##  Median :-0.053430    Median :-0.4829   Median :-0.4829    
##  Mean   :-0.054802    Mean   :-0.4973   Mean   :-0.4973    
##  3rd Qu.:-0.048985    3rd Qu.:-0.0919   3rd Qu.:-0.0919    
##  Max.   :-0.006941    Max.   : 0.6446   Max.   : 0.6446    
##  mean_tBodyAccJerkMag mean_tBodyGyroMag mean_tBodyGyroJerkMag
##  Min.   :-0.9928      Min.   :-0.9807   Min.   :-0.99732     
##  1st Qu.:-0.9807      1st Qu.:-0.9461   1st Qu.:-0.98515     
##  Median :-0.8168      Median :-0.6551   Median :-0.86479     
##  Mean   :-0.6079      Mean   :-0.5652   Mean   :-0.73637     
##  3rd Qu.:-0.2456      3rd Qu.:-0.2159   3rd Qu.:-0.51186     
##  Max.   : 0.4345      Max.   : 0.4180   Max.   : 0.08758     
##  mean_fBodyAcc_X   mean_fBodyAcc_Y    mean_fBodyAcc_Z  
##  Min.   :-0.9952   Min.   :-0.98903   Min.   :-0.9895  
##  1st Qu.:-0.9787   1st Qu.:-0.95361   1st Qu.:-0.9619  
##  Median :-0.7691   Median :-0.59498   Median :-0.7236  
##  Mean   :-0.5758   Mean   :-0.48873   Mean   :-0.6297  
##  3rd Qu.:-0.2174   3rd Qu.:-0.06341   3rd Qu.:-0.3183  
##  Max.   : 0.5370   Max.   : 0.52419   Max.   : 0.2807  
##  mean_fBodyAccJerk_X mean_fBodyAccJerk_Y mean_fBodyAccJerk_Z
##  Min.   :-0.9946     Min.   :-0.9894     Min.   :-0.9920    
##  1st Qu.:-0.9828     1st Qu.:-0.9725     1st Qu.:-0.9796    
##  Median :-0.8126     Median :-0.7817     Median :-0.8707    
##  Mean   :-0.6139     Mean   :-0.5882     Mean   :-0.7144    
##  3rd Qu.:-0.2820     3rd Qu.:-0.1963     3rd Qu.:-0.4697    
##  Max.   : 0.4743     Max.   : 0.2767     Max.   : 0.1578    
##  mean_fBodyGyro_X  mean_fBodyGyro_Y  mean_fBodyGyro_Z  mean_fBodyAccMag 
##  Min.   :-0.9931   Min.   :-0.9940   Min.   :-0.9860   Min.   :-0.9868  
##  1st Qu.:-0.9697   1st Qu.:-0.9700   1st Qu.:-0.9624   1st Qu.:-0.9560  
##  Median :-0.7300   Median :-0.8141   Median :-0.7909   Median :-0.6703  
##  Mean   :-0.6367   Mean   :-0.6767   Mean   :-0.6044   Mean   :-0.5365  
##  3rd Qu.:-0.3387   3rd Qu.:-0.4458   3rd Qu.:-0.2635   3rd Qu.:-0.1622  
##  Max.   : 0.4750   Max.   : 0.3288   Max.   : 0.4924   Max.   : 0.5866  
##  mean_fBodyBodyAccJerkMag mean_fBodyBodyGyroMag mean_fBodyBodyGyroJerkMag
##  Min.   :-0.9940          Min.   :-0.9865       Min.   :-0.9976          
##  1st Qu.:-0.9770          1st Qu.:-0.9616       1st Qu.:-0.9813          
##  Median :-0.7940          Median :-0.7657       Median :-0.8779          
##  Mean   :-0.5756          Mean   :-0.6671       Mean   :-0.7564          
##  3rd Qu.:-0.1872          3rd Qu.:-0.4087       3rd Qu.:-0.5831          
##  Max.   : 0.5384          Max.   : 0.2040       Max.   : 0.1466          
##  std_dev_tBodyAcc_X std_dev_tBodyAcc_Y std_dev_tBodyAcc_Z
##  Min.   :-0.9961    Min.   :-0.99024   Min.   :-0.9877   
##  1st Qu.:-0.9799    1st Qu.:-0.94205   1st Qu.:-0.9498   
##  Median :-0.7526    Median :-0.50897   Median :-0.6518   
##  Mean   :-0.5577    Mean   :-0.46046   Mean   :-0.5756   
##  3rd Qu.:-0.1984    3rd Qu.:-0.03077   3rd Qu.:-0.2306   
##  Max.   : 0.6269    Max.   : 0.61694   Max.   : 0.6090   
##  std_dev_tGravityAcc_X std_dev_tGravityAcc_Y std_dev_tGravityAcc_Z
##  Min.   :-0.9968       Min.   :-0.9942       Min.   :-0.9910      
##  1st Qu.:-0.9825       1st Qu.:-0.9711       1st Qu.:-0.9605      
##  Median :-0.9695       Median :-0.9590       Median :-0.9450      
##  Mean   :-0.9638       Mean   :-0.9524       Mean   :-0.9364      
##  3rd Qu.:-0.9509       3rd Qu.:-0.9370       3rd Qu.:-0.9180      
##  Max.   :-0.8296       Max.   :-0.6436       Max.   :-0.6102      
##  std_dev_tBodyAccJerk_X std_dev_tBodyAccJerk_Y std_dev_tBodyAccJerk_Z
##  Min.   :-0.9946        Min.   :-0.9895        Min.   :-0.99329      
##  1st Qu.:-0.9832        1st Qu.:-0.9724        1st Qu.:-0.98266      
##  Median :-0.8104        Median :-0.7756        Median :-0.88366      
##  Mean   :-0.5949        Mean   :-0.5654        Mean   :-0.73596      
##  3rd Qu.:-0.2233        3rd Qu.:-0.1483        3rd Qu.:-0.51212      
##  Max.   : 0.5443        Max.   : 0.3553        Max.   : 0.03102      
##  std_dev_tBodyGyro_X std_dev_tBodyGyro_Y std_dev_tBodyGyro_Z
##  Min.   :-0.9943     Min.   :-0.9942     Min.   :-0.9855    
##  1st Qu.:-0.9735     1st Qu.:-0.9629     1st Qu.:-0.9609    
##  Median :-0.7890     Median :-0.8017     Median :-0.8010    
##  Mean   :-0.6916     Mean   :-0.6533     Mean   :-0.6164    
##  3rd Qu.:-0.4414     3rd Qu.:-0.4196     3rd Qu.:-0.3106    
##  Max.   : 0.2677     Max.   : 0.4765     Max.   : 0.5649    
##  std_dev_tBodyGyroJerk_X std_dev_tBodyGyroJerk_Y std_dev_tBodyGyroJerk_Z
##  Min.   :-0.9965         Min.   :-0.9971         Min.   :-0.9954        
##  1st Qu.:-0.9800         1st Qu.:-0.9832         1st Qu.:-0.9848        
##  Median :-0.8396         Median :-0.8942         Median :-0.8610        
##  Mean   :-0.7036         Mean   :-0.7636         Mean   :-0.7096        
##  3rd Qu.:-0.4629         3rd Qu.:-0.5861         3rd Qu.:-0.4741        
##  Max.   : 0.1791         Max.   : 0.2959         Max.   : 0.1932        
##  std_dev_tBodyAccMag std_dev_tGravityAccMag std_dev_tBodyAccJerkMag
##  Min.   :-0.9865     Min.   :-0.9865        Min.   :-0.9946        
##  1st Qu.:-0.9430     1st Qu.:-0.9430        1st Qu.:-0.9765        
##  Median :-0.6074     Median :-0.6074        Median :-0.8014        
##  Mean   :-0.5439     Mean   :-0.5439        Mean   :-0.5842        
##  3rd Qu.:-0.2090     3rd Qu.:-0.2090        3rd Qu.:-0.2173        
##  Max.   : 0.4284     Max.   : 0.4284        Max.   : 0.4506        
##  std_dev_tBodyGyroMag std_dev_tBodyGyroJerkMag std_dev_fBodyAcc_X
##  Min.   :-0.9814      Min.   :-0.9977          Min.   :-0.9966   
##  1st Qu.:-0.9476      1st Qu.:-0.9805          1st Qu.:-0.9820   
##  Median :-0.7420      Median :-0.8809          Median :-0.7470   
##  Mean   :-0.6304      Mean   :-0.7550          Mean   :-0.5522   
##  3rd Qu.:-0.3602      3rd Qu.:-0.5767          3rd Qu.:-0.1966   
##  Max.   : 0.3000      Max.   : 0.2502          Max.   : 0.6585   
##  std_dev_fBodyAcc_Y std_dev_fBodyAcc_Z std_dev_fBodyAccJerk_X
##  Min.   :-0.99068   Min.   :-0.9872    Min.   :-0.9951       
##  1st Qu.:-0.94042   1st Qu.:-0.9459    1st Qu.:-0.9847       
##  Median :-0.51338   Median :-0.6441    Median :-0.8254       
##  Mean   :-0.48148   Mean   :-0.5824    Mean   :-0.6121       
##  3rd Qu.:-0.07913   3rd Qu.:-0.2655    3rd Qu.:-0.2475       
##  Max.   : 0.56019   Max.   : 0.6871    Max.   : 0.4768       
##  std_dev_fBodyAccJerk_Y std_dev_fBodyAccJerk_Z std_dev_fBodyGyro_X
##  Min.   :-0.9905        Min.   :-0.993108      Min.   :-0.9947    
##  1st Qu.:-0.9737        1st Qu.:-0.983747      1st Qu.:-0.9750    
##  Median :-0.7852        Median :-0.895121      Median :-0.8086    
##  Mean   :-0.5707        Mean   :-0.756489      Mean   :-0.7110    
##  3rd Qu.:-0.1685        3rd Qu.:-0.543787      3rd Qu.:-0.4813    
##  Max.   : 0.3498        Max.   :-0.006236      Max.   : 0.1966    
##  std_dev_fBodyGyro_Y std_dev_fBodyGyro_Z std_dev_fBodyAccMag
##  Min.   :-0.9944     Min.   :-0.9867     Min.   :-0.9876    
##  1st Qu.:-0.9602     1st Qu.:-0.9643     1st Qu.:-0.9452    
##  Median :-0.7964     Median :-0.8224     Median :-0.6513    
##  Mean   :-0.6454     Mean   :-0.6577     Mean   :-0.6210    
##  3rd Qu.:-0.4154     3rd Qu.:-0.3916     3rd Qu.:-0.3654    
##  Max.   : 0.6462     Max.   : 0.5225     Max.   : 0.1787    
##  std_dev_fBodyBodyAccJerkMag std_dev_fBodyBodyGyroMag
##  Min.   :-0.9944             Min.   :-0.9815         
##  1st Qu.:-0.9752             1st Qu.:-0.9488         
##  Median :-0.8126             Median :-0.7727         
##  Mean   :-0.5992             Mean   :-0.6723         
##  3rd Qu.:-0.2668             3rd Qu.:-0.4277         
##  Max.   : 0.3163             Max.   : 0.2367         
##  std_dev_fBodyBodyGyroJerkMag
##  Min.   :-0.9976             
##  1st Qu.:-0.9802             
##  Median :-0.8941             
##  Mean   :-0.7715             
##  3rd Qu.:-0.6081             
##  Max.   : 0.2878
```

