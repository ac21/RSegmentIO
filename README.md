# RSegmentIO

A consistent and safe way to interact with Segment.com (formally Segment.IO)


## Setup

### 1) install and Load Library Locally
Add library to your local project
```R
devtools::install_github("ac21/RSegmentIO")
library(RSittercitySegment)
```

### 2) Setup Environmental Variables
```
CH_SEGMENT_WRITEKEY="valid-write-key"
```

#### Configuring project-only environmental variables for RStudio
To setup local environmental variables just for a given R package, you can create a .Renviron file and store the above variables


## Using RSittercitySemgnet

### Call Identify
```R
# call Identify with a trait of 'status' equal to 'closed' 
identify(
  userId = 'fake_uuid',
  traits = list(status = 'closed')
)
```
