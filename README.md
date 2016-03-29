# Fingerprints visualization
Guillermo Basulto-Elias  



## fingerprints-vis

This is a shiny app in `R` created with the purpose of visualize fingerprints from NIST Special Database 4.

## Installation

- Download and unzip the database (it is big: 822MB) from NIST website [(here)](http://www.nist.gov/srd/nistsd4.cfm).

- Install functions required to read the images, which are bundled into an `R` package: 
    + Install `devtools` package in R if you do not have it.
    + Run `devtools::install_github("gbasulto/fingerprints")`.

- Download app files. Either
    + Clone this repository, or
    + download .zip file by clicking "Download zip" and unzip it.

- Open R and change the directory to the folder where `server.R` and `ui.R` are located.
    
- Open the file `server.R` and replace the path to the folder "png_txt", which is a subfolder of the unzipped database (**If you have a better idea of how to to this without modifying the file and introducing the path directly from the shiny app, please let me know =)** ).

- Install the package `shiny` if you do not have it already.

- Type `shiny::runApp()`.
