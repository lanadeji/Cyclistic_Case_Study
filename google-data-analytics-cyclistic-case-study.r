{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "1bb42f4b",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "papermill": {
     "duration": 0.09261,
     "end_time": "2022-01-07T18:51:59.951696",
     "exception": false,
     "start_time": "2022-01-07T18:51:59.859086",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Introduction"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5cabcc73",
   "metadata": {
    "papermill": {
     "duration": 0.092304,
     "end_time": "2022-01-07T18:52:00.137447",
     "exception": false,
     "start_time": "2022-01-07T18:52:00.045143",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Business Task"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "934ff476",
   "metadata": {
    "papermill": {
     "duration": 0.090512,
     "end_time": "2022-01-07T18:52:00.319619",
     "exception": false,
     "start_time": "2022-01-07T18:52:00.229107",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Prepare"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "c80eec99",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:52:00.506996Z",
     "iopub.status.busy": "2022-01-07T18:52:00.504717Z",
     "iopub.status.idle": "2022-01-07T18:52:02.113575Z",
     "shell.execute_reply": "2022-01-07T18:52:02.112414Z"
    },
    "papermill": {
     "duration": 1.70485,
     "end_time": "2022-01-07T18:52:02.113750",
     "exception": false,
     "start_time": "2022-01-07T18:52:00.408900",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.1 ──\n",
      "\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.5     \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.5     \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.7\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.1.4     \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.0.2     \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.1\n",
      "\n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n",
      "\n",
      "Attaching package: ‘lubridate’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    date, intersect, setdiff, union\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "# Install and load packages\n",
    "library(\"tidyverse\")\n",
    "library(\"dplyr\")\n",
    "library(lubridate)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "d7945691",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:52:02.352816Z",
     "iopub.status.busy": "2022-01-07T18:52:02.319095Z",
     "iopub.status.idle": "2022-01-07T18:52:06.837082Z",
     "shell.execute_reply": "2022-01-07T18:52:06.835617Z"
    },
    "papermill": {
     "duration": 4.620164,
     "end_time": "2022-01-07T18:52:06.837264",
     "exception": false,
     "start_time": "2022-01-07T18:52:02.217100",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Load data sets for trip data for 12 months (Nov 2020 to Oct 2021)\n",
    "Nov_2020 <- read_csv(\"../input/cyclistic-datasets/202011-divvy-tripdata.csv\",show_col_types = FALSE)\n",
    "Dec_2020 <- read_csv(\"../input/cyclistic-datasets/202012-divvy-tripdata.csv\",show_col_types = FALSE)\n",
    "Jan_2021 <- read_csv(\"../input/cyclistic-datasets/202101-divvy-tripdata.csv\",show_col_types = FALSE)\n",
    "Feb_2021 <- read_csv(\"../input/cyclistic-datasets/202102-divvy-tripdata.csv\",show_col_types = FALSE)\n",
    "Mar_2021 <- read_csv(\"../input/cyclistic-datasets/202103-divvy-tripdata.csv\",show_col_types = FALSE)\n",
    "Apr_2021 <- read_csv(\"../input/cyclistic-datasets/202104-divvy-tripdata.csv\",show_col_types = FALSE)\n",
    "May_2021 <- read_csv(\"../input/cyclistic-datasets/202105-divvy-tripdata.csv\",show_col_types = FALSE)\n",
    "Jun_2021 <- read_csv(\"../input/cyclistic-datasets/202106-divvy-tripdata.csv\",show_col_types = FALSE)\n",
    "Jul_2021 <- read_csv(\"../input/cyclistic-datasets/202107-divvy-tripdata.csv\",show_col_types = FALSE)\n",
    "Aug_2021 <- read_csv(\"../input/cyclistic-datasets/202108-divvy-tripdata.csv\",show_col_types = FALSE)\n",
    "Sep_2021 <- read_csv(\"../input/cyclistic-datasets/202109-divvy-tripdata.csv\",show_col_types = FALSE)\n",
    "Oct_2021 <- read_csv(\"../input/cyclistic-datasets/202110-divvy-tripdata.csv\",show_col_types = FALSE)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "e718350f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:52:07.056680Z",
     "iopub.status.busy": "2022-01-07T18:52:07.054804Z",
     "iopub.status.idle": "2022-01-07T18:52:07.179586Z",
     "shell.execute_reply": "2022-01-07T18:52:07.177626Z"
    },
    "papermill": {
     "duration": 0.23539,
     "end_time": "2022-01-07T18:52:07.179750",
     "exception": false,
     "start_time": "2022-01-07T18:52:06.944360",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 13</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>BD0A6FF6FFF9B921</td><td>electric_bike</td><td>2020-11-01 13:36:00</td><td>2020-11-01 13:45:40</td><td><span style=white-space:pre-wrap>Dearborn St &amp; Erie St    </span></td><td>110</td><td><span style=white-space:pre-wrap>St. Clair St &amp; Erie St   </span></td><td>211</td><td>41.89418</td><td>-87.62913</td><td>41.89443</td><td>-87.62338</td><td>casual</td></tr>\n",
       "\t<tr><td>96A7A7A4BDE4F82D</td><td>electric_bike</td><td>2020-11-01 10:03:26</td><td>2020-11-01 10:14:45</td><td>Franklin St &amp; Illinois St</td><td>672</td><td>Noble St &amp; Milwaukee Ave </td><td> 29</td><td>41.89096</td><td>-87.63534</td><td>41.90067</td><td>-87.66248</td><td>casual</td></tr>\n",
       "\t<tr><td>C61526D06582BDC5</td><td>electric_bike</td><td>2020-11-01 00:34:05</td><td>2020-11-01 01:03:06</td><td>Lake Shore Dr &amp; Monroe St</td><td> 76</td><td><span style=white-space:pre-wrap>Federal St &amp; Polk St     </span></td><td> 41</td><td>41.88098</td><td>-87.61675</td><td>41.87205</td><td>-87.62955</td><td>casual</td></tr>\n",
       "\t<tr><td>E533E89C32080B9E</td><td>electric_bike</td><td>2020-11-01 00:45:16</td><td>2020-11-01 00:54:31</td><td>Leavitt St &amp; Chicago Ave </td><td>659</td><td><span style=white-space:pre-wrap>Stave St &amp; Armitage Ave  </span></td><td>185</td><td>41.89550</td><td>-87.68201</td><td>41.91774</td><td>-87.69139</td><td>casual</td></tr>\n",
       "\t<tr><td>1C9F4EF18C168C60</td><td>electric_bike</td><td>2020-11-01 15:43:25</td><td>2020-11-01 16:16:52</td><td>Buckingham Fountain      </td><td>  2</td><td>Buckingham Fountain      </td><td>  2</td><td>41.87650</td><td>-87.62036</td><td>41.87645</td><td>-87.62034</td><td>casual</td></tr>\n",
       "\t<tr><td>7259585D8276D338</td><td>electric_bike</td><td>2020-11-14 15:55:17</td><td>2020-11-14 16:44:38</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; 16th St     </span></td><td> 72</td><td>Lake Shore Dr &amp; Monroe St</td><td> 76</td><td>41.86029</td><td>-87.62581</td><td>41.88099</td><td>-87.61677</td><td>casual</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 13\n",
       "\\begin{tabular}{lllllllllllll}\n",
       " ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual\\\\\n",
       " <chr> & <chr> & <dttm> & <dttm> & <chr> & <dbl> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t BD0A6FF6FFF9B921 & electric\\_bike & 2020-11-01 13:36:00 & 2020-11-01 13:45:40 & Dearborn St \\& Erie St     & 110 & St. Clair St \\& Erie St    & 211 & 41.89418 & -87.62913 & 41.89443 & -87.62338 & casual\\\\\n",
       "\t 96A7A7A4BDE4F82D & electric\\_bike & 2020-11-01 10:03:26 & 2020-11-01 10:14:45 & Franklin St \\& Illinois St & 672 & Noble St \\& Milwaukee Ave  &  29 & 41.89096 & -87.63534 & 41.90067 & -87.66248 & casual\\\\\n",
       "\t C61526D06582BDC5 & electric\\_bike & 2020-11-01 00:34:05 & 2020-11-01 01:03:06 & Lake Shore Dr \\& Monroe St &  76 & Federal St \\& Polk St      &  41 & 41.88098 & -87.61675 & 41.87205 & -87.62955 & casual\\\\\n",
       "\t E533E89C32080B9E & electric\\_bike & 2020-11-01 00:45:16 & 2020-11-01 00:54:31 & Leavitt St \\& Chicago Ave  & 659 & Stave St \\& Armitage Ave   & 185 & 41.89550 & -87.68201 & 41.91774 & -87.69139 & casual\\\\\n",
       "\t 1C9F4EF18C168C60 & electric\\_bike & 2020-11-01 15:43:25 & 2020-11-01 16:16:52 & Buckingham Fountain       &   2 & Buckingham Fountain       &   2 & 41.87650 & -87.62036 & 41.87645 & -87.62034 & casual\\\\\n",
       "\t 7259585D8276D338 & electric\\_bike & 2020-11-14 15:55:17 & 2020-11-14 16:44:38 & Wabash Ave \\& 16th St      &  72 & Lake Shore Dr \\& Monroe St &  76 & 41.86029 & -87.62581 & 41.88099 & -87.61677 & casual\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 13\n",
       "\n",
       "| ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;dbl&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;dbl&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| BD0A6FF6FFF9B921 | electric_bike | 2020-11-01 13:36:00 | 2020-11-01 13:45:40 | Dearborn St &amp; Erie St     | 110 | St. Clair St &amp; Erie St    | 211 | 41.89418 | -87.62913 | 41.89443 | -87.62338 | casual |\n",
       "| 96A7A7A4BDE4F82D | electric_bike | 2020-11-01 10:03:26 | 2020-11-01 10:14:45 | Franklin St &amp; Illinois St | 672 | Noble St &amp; Milwaukee Ave  |  29 | 41.89096 | -87.63534 | 41.90067 | -87.66248 | casual |\n",
       "| C61526D06582BDC5 | electric_bike | 2020-11-01 00:34:05 | 2020-11-01 01:03:06 | Lake Shore Dr &amp; Monroe St |  76 | Federal St &amp; Polk St      |  41 | 41.88098 | -87.61675 | 41.87205 | -87.62955 | casual |\n",
       "| E533E89C32080B9E | electric_bike | 2020-11-01 00:45:16 | 2020-11-01 00:54:31 | Leavitt St &amp; Chicago Ave  | 659 | Stave St &amp; Armitage Ave   | 185 | 41.89550 | -87.68201 | 41.91774 | -87.69139 | casual |\n",
       "| 1C9F4EF18C168C60 | electric_bike | 2020-11-01 15:43:25 | 2020-11-01 16:16:52 | Buckingham Fountain       |   2 | Buckingham Fountain       |   2 | 41.87650 | -87.62036 | 41.87645 | -87.62034 | casual |\n",
       "| 7259585D8276D338 | electric_bike | 2020-11-14 15:55:17 | 2020-11-14 16:44:38 | Wabash Ave &amp; 16th St      |  72 | Lake Shore Dr &amp; Monroe St |  76 | 41.86029 | -87.62581 | 41.88099 | -87.61677 | casual |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 BD0A6FF6FFF9B921 electric_bike 2020-11-01 13:36:00 2020-11-01 13:45:40\n",
       "2 96A7A7A4BDE4F82D electric_bike 2020-11-01 10:03:26 2020-11-01 10:14:45\n",
       "3 C61526D06582BDC5 electric_bike 2020-11-01 00:34:05 2020-11-01 01:03:06\n",
       "4 E533E89C32080B9E electric_bike 2020-11-01 00:45:16 2020-11-01 00:54:31\n",
       "5 1C9F4EF18C168C60 electric_bike 2020-11-01 15:43:25 2020-11-01 16:16:52\n",
       "6 7259585D8276D338 electric_bike 2020-11-14 15:55:17 2020-11-14 16:44:38\n",
       "  start_station_name        start_station_id end_station_name         \n",
       "1 Dearborn St & Erie St     110              St. Clair St & Erie St   \n",
       "2 Franklin St & Illinois St 672              Noble St & Milwaukee Ave \n",
       "3 Lake Shore Dr & Monroe St  76              Federal St & Polk St     \n",
       "4 Leavitt St & Chicago Ave  659              Stave St & Armitage Ave  \n",
       "5 Buckingham Fountain         2              Buckingham Fountain      \n",
       "6 Wabash Ave & 16th St       72              Lake Shore Dr & Monroe St\n",
       "  end_station_id start_lat start_lng end_lat  end_lng   member_casual\n",
       "1 211            41.89418  -87.62913 41.89443 -87.62338 casual       \n",
       "2  29            41.89096  -87.63534 41.90067 -87.66248 casual       \n",
       "3  41            41.88098  -87.61675 41.87205 -87.62955 casual       \n",
       "4 185            41.89550  -87.68201 41.91774 -87.69139 casual       \n",
       "5   2            41.87650  -87.62036 41.87645 -87.62034 casual       \n",
       "6  76            41.86029  -87.62581 41.88099 -87.61677 casual       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 13</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>6C992BD37A98A63F</td><td>classic_bike</td><td>2021-04-12 18:25:36</td><td>2021-04-12 18:56:55</td><td><span style=white-space:pre-wrap>State St &amp; Pearson St   </span></td><td>TA1307000061</td><td>Southport Ave &amp; Waveland Ave</td><td><span style=white-space:pre-wrap>13235       </span></td><td>41.89745</td><td>-87.62872</td><td>41.94815</td><td>-87.66394</td><td>member</td></tr>\n",
       "\t<tr><td>1E0145613A209000</td><td>docked_bike </td><td>2021-04-27 17:27:11</td><td>2021-04-27 18:31:29</td><td>Dorchester Ave &amp; 49th St</td><td>KA1503000069</td><td><span style=white-space:pre-wrap>Dorchester Ave &amp; 49th St    </span></td><td>KA1503000069</td><td>41.80577</td><td>-87.59246</td><td>41.80577</td><td>-87.59246</td><td>casual</td></tr>\n",
       "\t<tr><td>E498E15508A80BAD</td><td>docked_bike </td><td>2021-04-03 12:42:45</td><td>2021-04-07 11:40:24</td><td><span style=white-space:pre-wrap>Loomis Blvd &amp; 84th St   </span></td><td><span style=white-space:pre-wrap>20121       </span></td><td><span style=white-space:pre-wrap>Loomis Blvd &amp; 84th St       </span></td><td><span style=white-space:pre-wrap>20121       </span></td><td>41.74149</td><td>-87.65841</td><td>41.74149</td><td>-87.65841</td><td>casual</td></tr>\n",
       "\t<tr><td>1887262AD101C604</td><td>classic_bike</td><td>2021-04-17 09:17:42</td><td>2021-04-17 09:42:48</td><td>Honore St &amp; Division St </td><td>TA1305000034</td><td>Southport Ave &amp; Waveland Ave</td><td><span style=white-space:pre-wrap>13235       </span></td><td>41.90312</td><td>-87.67394</td><td>41.94815</td><td>-87.66394</td><td>member</td></tr>\n",
       "\t<tr><td>C123548CAB2A32A5</td><td>docked_bike </td><td>2021-04-03 12:42:25</td><td>2021-04-03 14:13:42</td><td><span style=white-space:pre-wrap>Loomis Blvd &amp; 84th St   </span></td><td><span style=white-space:pre-wrap>20121       </span></td><td><span style=white-space:pre-wrap>Loomis Blvd &amp; 84th St       </span></td><td><span style=white-space:pre-wrap>20121       </span></td><td>41.74149</td><td>-87.65841</td><td>41.74149</td><td>-87.65841</td><td>casual</td></tr>\n",
       "\t<tr><td>097E76F3651B1AC1</td><td>classic_bike</td><td>2021-04-25 18:43:18</td><td>2021-04-25 18:43:59</td><td><span style=white-space:pre-wrap>Clinton St &amp; Polk St    </span></td><td><span style=white-space:pre-wrap>15542       </span></td><td><span style=white-space:pre-wrap>Clinton St &amp; Polk St        </span></td><td><span style=white-space:pre-wrap>15542       </span></td><td>41.87147</td><td>-87.64095</td><td>41.87147</td><td>-87.64095</td><td>casual</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 13\n",
       "\\begin{tabular}{lllllllllllll}\n",
       " ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual\\\\\n",
       " <chr> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t 6C992BD37A98A63F & classic\\_bike & 2021-04-12 18:25:36 & 2021-04-12 18:56:55 & State St \\& Pearson St    & TA1307000061 & Southport Ave \\& Waveland Ave & 13235        & 41.89745 & -87.62872 & 41.94815 & -87.66394 & member\\\\\n",
       "\t 1E0145613A209000 & docked\\_bike  & 2021-04-27 17:27:11 & 2021-04-27 18:31:29 & Dorchester Ave \\& 49th St & KA1503000069 & Dorchester Ave \\& 49th St     & KA1503000069 & 41.80577 & -87.59246 & 41.80577 & -87.59246 & casual\\\\\n",
       "\t E498E15508A80BAD & docked\\_bike  & 2021-04-03 12:42:45 & 2021-04-07 11:40:24 & Loomis Blvd \\& 84th St    & 20121        & Loomis Blvd \\& 84th St        & 20121        & 41.74149 & -87.65841 & 41.74149 & -87.65841 & casual\\\\\n",
       "\t 1887262AD101C604 & classic\\_bike & 2021-04-17 09:17:42 & 2021-04-17 09:42:48 & Honore St \\& Division St  & TA1305000034 & Southport Ave \\& Waveland Ave & 13235        & 41.90312 & -87.67394 & 41.94815 & -87.66394 & member\\\\\n",
       "\t C123548CAB2A32A5 & docked\\_bike  & 2021-04-03 12:42:25 & 2021-04-03 14:13:42 & Loomis Blvd \\& 84th St    & 20121        & Loomis Blvd \\& 84th St        & 20121        & 41.74149 & -87.65841 & 41.74149 & -87.65841 & casual\\\\\n",
       "\t 097E76F3651B1AC1 & classic\\_bike & 2021-04-25 18:43:18 & 2021-04-25 18:43:59 & Clinton St \\& Polk St     & 15542        & Clinton St \\& Polk St         & 15542        & 41.87147 & -87.64095 & 41.87147 & -87.64095 & casual\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 13\n",
       "\n",
       "| ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 6C992BD37A98A63F | classic_bike | 2021-04-12 18:25:36 | 2021-04-12 18:56:55 | State St &amp; Pearson St    | TA1307000061 | Southport Ave &amp; Waveland Ave | 13235        | 41.89745 | -87.62872 | 41.94815 | -87.66394 | member |\n",
       "| 1E0145613A209000 | docked_bike  | 2021-04-27 17:27:11 | 2021-04-27 18:31:29 | Dorchester Ave &amp; 49th St | KA1503000069 | Dorchester Ave &amp; 49th St     | KA1503000069 | 41.80577 | -87.59246 | 41.80577 | -87.59246 | casual |\n",
       "| E498E15508A80BAD | docked_bike  | 2021-04-03 12:42:45 | 2021-04-07 11:40:24 | Loomis Blvd &amp; 84th St    | 20121        | Loomis Blvd &amp; 84th St        | 20121        | 41.74149 | -87.65841 | 41.74149 | -87.65841 | casual |\n",
       "| 1887262AD101C604 | classic_bike | 2021-04-17 09:17:42 | 2021-04-17 09:42:48 | Honore St &amp; Division St  | TA1305000034 | Southport Ave &amp; Waveland Ave | 13235        | 41.90312 | -87.67394 | 41.94815 | -87.66394 | member |\n",
       "| C123548CAB2A32A5 | docked_bike  | 2021-04-03 12:42:25 | 2021-04-03 14:13:42 | Loomis Blvd &amp; 84th St    | 20121        | Loomis Blvd &amp; 84th St        | 20121        | 41.74149 | -87.65841 | 41.74149 | -87.65841 | casual |\n",
       "| 097E76F3651B1AC1 | classic_bike | 2021-04-25 18:43:18 | 2021-04-25 18:43:59 | Clinton St &amp; Polk St     | 15542        | Clinton St &amp; Polk St         | 15542        | 41.87147 | -87.64095 | 41.87147 | -87.64095 | casual |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 6C992BD37A98A63F classic_bike  2021-04-12 18:25:36 2021-04-12 18:56:55\n",
       "2 1E0145613A209000 docked_bike   2021-04-27 17:27:11 2021-04-27 18:31:29\n",
       "3 E498E15508A80BAD docked_bike   2021-04-03 12:42:45 2021-04-07 11:40:24\n",
       "4 1887262AD101C604 classic_bike  2021-04-17 09:17:42 2021-04-17 09:42:48\n",
       "5 C123548CAB2A32A5 docked_bike   2021-04-03 12:42:25 2021-04-03 14:13:42\n",
       "6 097E76F3651B1AC1 classic_bike  2021-04-25 18:43:18 2021-04-25 18:43:59\n",
       "  start_station_name       start_station_id end_station_name            \n",
       "1 State St & Pearson St    TA1307000061     Southport Ave & Waveland Ave\n",
       "2 Dorchester Ave & 49th St KA1503000069     Dorchester Ave & 49th St    \n",
       "3 Loomis Blvd & 84th St    20121            Loomis Blvd & 84th St       \n",
       "4 Honore St & Division St  TA1305000034     Southport Ave & Waveland Ave\n",
       "5 Loomis Blvd & 84th St    20121            Loomis Blvd & 84th St       \n",
       "6 Clinton St & Polk St     15542            Clinton St & Polk St        \n",
       "  end_station_id start_lat start_lng end_lat  end_lng   member_casual\n",
       "1 13235          41.89745  -87.62872 41.94815 -87.66394 member       \n",
       "2 KA1503000069   41.80577  -87.59246 41.80577 -87.59246 casual       \n",
       "3 20121          41.74149  -87.65841 41.74149 -87.65841 casual       \n",
       "4 13235          41.90312  -87.67394 41.94815 -87.66394 member       \n",
       "5 20121          41.74149  -87.65841 41.74149 -87.65841 casual       \n",
       "6 15542          41.87147  -87.64095 41.87147 -87.64095 casual       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 13</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>620BC6107255BF4C</td><td>electric_bike</td><td>2021-10-22 12:46:42</td><td>2021-10-22 12:49:50</td><td>Kingsbury St &amp; Kinzie St</td><td>KA1503000043</td><td>NA</td><td>NA</td><td>41.88919</td><td>-87.6385</td><td>41.89</td><td>-87.63</td><td>member</td></tr>\n",
       "\t<tr><td>4471C70731AB2E45</td><td>electric_bike</td><td>2021-10-21 09:12:37</td><td>2021-10-21 09:14:14</td><td>NA                      </td><td>NA          </td><td>NA</td><td>NA</td><td>41.93000</td><td>-87.7000</td><td>41.93</td><td>-87.71</td><td>member</td></tr>\n",
       "\t<tr><td>26CA69D43D15EE14</td><td>electric_bike</td><td>2021-10-16 16:28:39</td><td>2021-10-16 16:36:26</td><td>NA                      </td><td>NA          </td><td>NA</td><td>NA</td><td>41.92000</td><td>-87.7000</td><td>41.94</td><td>-87.72</td><td>member</td></tr>\n",
       "\t<tr><td>362947F0437E1514</td><td>electric_bike</td><td>2021-10-16 16:17:48</td><td>2021-10-16 16:19:03</td><td>NA                      </td><td>NA          </td><td>NA</td><td>NA</td><td>41.92000</td><td>-87.6900</td><td>41.92</td><td>-87.69</td><td>member</td></tr>\n",
       "\t<tr><td>BB731DE2F2EC51C5</td><td>electric_bike</td><td>2021-10-20 23:17:54</td><td>2021-10-20 23:26:10</td><td>NA                      </td><td>NA          </td><td>NA</td><td>NA</td><td>41.89000</td><td>-87.7100</td><td>41.89</td><td>-87.69</td><td>member</td></tr>\n",
       "\t<tr><td>7176307BBC097313</td><td>electric_bike</td><td>2021-10-21 16:57:37</td><td>2021-10-21 17:11:58</td><td>NA                      </td><td>NA          </td><td>NA</td><td>NA</td><td>41.89000</td><td>-87.7100</td><td>41.93</td><td>-87.70</td><td>member</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 13\n",
       "\\begin{tabular}{lllllllllllll}\n",
       " ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual\\\\\n",
       " <chr> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t 620BC6107255BF4C & electric\\_bike & 2021-10-22 12:46:42 & 2021-10-22 12:49:50 & Kingsbury St \\& Kinzie St & KA1503000043 & NA & NA & 41.88919 & -87.6385 & 41.89 & -87.63 & member\\\\\n",
       "\t 4471C70731AB2E45 & electric\\_bike & 2021-10-21 09:12:37 & 2021-10-21 09:14:14 & NA                       & NA           & NA & NA & 41.93000 & -87.7000 & 41.93 & -87.71 & member\\\\\n",
       "\t 26CA69D43D15EE14 & electric\\_bike & 2021-10-16 16:28:39 & 2021-10-16 16:36:26 & NA                       & NA           & NA & NA & 41.92000 & -87.7000 & 41.94 & -87.72 & member\\\\\n",
       "\t 362947F0437E1514 & electric\\_bike & 2021-10-16 16:17:48 & 2021-10-16 16:19:03 & NA                       & NA           & NA & NA & 41.92000 & -87.6900 & 41.92 & -87.69 & member\\\\\n",
       "\t BB731DE2F2EC51C5 & electric\\_bike & 2021-10-20 23:17:54 & 2021-10-20 23:26:10 & NA                       & NA           & NA & NA & 41.89000 & -87.7100 & 41.89 & -87.69 & member\\\\\n",
       "\t 7176307BBC097313 & electric\\_bike & 2021-10-21 16:57:37 & 2021-10-21 17:11:58 & NA                       & NA           & NA & NA & 41.89000 & -87.7100 & 41.93 & -87.70 & member\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 13\n",
       "\n",
       "| ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 620BC6107255BF4C | electric_bike | 2021-10-22 12:46:42 | 2021-10-22 12:49:50 | Kingsbury St &amp; Kinzie St | KA1503000043 | NA | NA | 41.88919 | -87.6385 | 41.89 | -87.63 | member |\n",
       "| 4471C70731AB2E45 | electric_bike | 2021-10-21 09:12:37 | 2021-10-21 09:14:14 | NA                       | NA           | NA | NA | 41.93000 | -87.7000 | 41.93 | -87.71 | member |\n",
       "| 26CA69D43D15EE14 | electric_bike | 2021-10-16 16:28:39 | 2021-10-16 16:36:26 | NA                       | NA           | NA | NA | 41.92000 | -87.7000 | 41.94 | -87.72 | member |\n",
       "| 362947F0437E1514 | electric_bike | 2021-10-16 16:17:48 | 2021-10-16 16:19:03 | NA                       | NA           | NA | NA | 41.92000 | -87.6900 | 41.92 | -87.69 | member |\n",
       "| BB731DE2F2EC51C5 | electric_bike | 2021-10-20 23:17:54 | 2021-10-20 23:26:10 | NA                       | NA           | NA | NA | 41.89000 | -87.7100 | 41.89 | -87.69 | member |\n",
       "| 7176307BBC097313 | electric_bike | 2021-10-21 16:57:37 | 2021-10-21 17:11:58 | NA                       | NA           | NA | NA | 41.89000 | -87.7100 | 41.93 | -87.70 | member |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 620BC6107255BF4C electric_bike 2021-10-22 12:46:42 2021-10-22 12:49:50\n",
       "2 4471C70731AB2E45 electric_bike 2021-10-21 09:12:37 2021-10-21 09:14:14\n",
       "3 26CA69D43D15EE14 electric_bike 2021-10-16 16:28:39 2021-10-16 16:36:26\n",
       "4 362947F0437E1514 electric_bike 2021-10-16 16:17:48 2021-10-16 16:19:03\n",
       "5 BB731DE2F2EC51C5 electric_bike 2021-10-20 23:17:54 2021-10-20 23:26:10\n",
       "6 7176307BBC097313 electric_bike 2021-10-21 16:57:37 2021-10-21 17:11:58\n",
       "  start_station_name       start_station_id end_station_name end_station_id\n",
       "1 Kingsbury St & Kinzie St KA1503000043     NA               NA            \n",
       "2 NA                       NA               NA               NA            \n",
       "3 NA                       NA               NA               NA            \n",
       "4 NA                       NA               NA               NA            \n",
       "5 NA                       NA               NA               NA            \n",
       "6 NA                       NA               NA               NA            \n",
       "  start_lat start_lng end_lat end_lng member_casual\n",
       "1 41.88919  -87.6385  41.89   -87.63  member       \n",
       "2 41.93000  -87.7000  41.93   -87.71  member       \n",
       "3 41.92000  -87.7000  41.94   -87.72  member       \n",
       "4 41.92000  -87.6900  41.92   -87.69  member       \n",
       "5 41.89000  -87.7100  41.89   -87.69  member       \n",
       "6 41.89000  -87.7100  41.93   -87.70  member       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# View data frames\n",
    "head(Nov_2020)\n",
    "colnames(Nov_2020)\n",
    "\n",
    "head(Apr_2021)\n",
    "colnames(Apr_2021)\n",
    "\n",
    "head(Oct_2021)\n",
    "colnames(Oct_2021)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "fde692f4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:52:07.412953Z",
     "iopub.status.busy": "2022-01-07T18:52:07.411013Z",
     "iopub.status.idle": "2022-01-07T18:52:45.392481Z",
     "shell.execute_reply": "2022-01-07T18:52:45.390476Z"
    },
    "papermill": {
     "duration": 38.099228,
     "end_time": "2022-01-07T18:52:45.392743",
     "exception": false,
     "start_time": "2022-01-07T18:52:07.293515",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Combine data for all months into one large data frame\n",
    "dframe <- rbind(Nov_2020, Dec_2020, Jan_2021, Feb_2021, Mar_2021, Apr_2021,\n",
    "                May_2021, Jun_2021, Jul_2021, Aug_2021, Sep_2021, Oct_2021)\n",
    "bike_trip_data <- dframe"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "3d36ebe2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:52:45.627023Z",
     "iopub.status.busy": "2022-01-07T18:52:45.624965Z",
     "iopub.status.idle": "2022-01-07T18:52:45.676747Z",
     "shell.execute_reply": "2022-01-07T18:52:45.674758Z"
    },
    "papermill": {
     "duration": 0.170426,
     "end_time": "2022-01-07T18:52:45.676953",
     "exception": false,
     "start_time": "2022-01-07T18:52:45.506527",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "spec_tbl_df [5,378,834 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ ride_id           : chr [1:5378834] \"BD0A6FF6FFF9B921\" \"96A7A7A4BDE4F82D\" \"C61526D06582BDC5\" \"E533E89C32080B9E\" ...\n",
      " $ rideable_type     : chr [1:5378834] \"electric_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : POSIXct[1:5378834], format: \"2020-11-01 13:36:00\" \"2020-11-01 10:03:26\" ...\n",
      " $ ended_at          : POSIXct[1:5378834], format: \"2020-11-01 13:45:40\" \"2020-11-01 10:14:45\" ...\n",
      " $ start_station_name: chr [1:5378834] \"Dearborn St & Erie St\" \"Franklin St & Illinois St\" \"Lake Shore Dr & Monroe St\" \"Leavitt St & Chicago Ave\" ...\n",
      " $ start_station_id  : chr [1:5378834] \"110\" \"672\" \"76\" \"659\" ...\n",
      " $ end_station_name  : chr [1:5378834] \"St. Clair St & Erie St\" \"Noble St & Milwaukee Ave\" \"Federal St & Polk St\" \"Stave St & Armitage Ave\" ...\n",
      " $ end_station_id    : chr [1:5378834] \"211\" \"29\" \"41\" \"185\" ...\n",
      " $ start_lat         : num [1:5378834] 41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num [1:5378834] -87.6 -87.6 -87.6 -87.7 -87.6 ...\n",
      " $ end_lat           : num [1:5378834] 41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num [1:5378834] -87.6 -87.7 -87.6 -87.7 -87.6 ...\n",
      " $ member_casual     : chr [1:5378834] \"casual\" \"casual\" \"casual\" \"casual\" ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   ride_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   rideable_type = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   started_at = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   ended_at = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   start_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_station_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_station_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   start_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   start_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   member_casual = \u001b[31mcol_character()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n"
     ]
    }
   ],
   "source": [
    "str(bike_trip_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "ec23cc65",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:52:45.909058Z",
     "iopub.status.busy": "2022-01-07T18:52:45.906096Z",
     "iopub.status.idle": "2022-01-07T18:52:45.926223Z",
     "shell.execute_reply": "2022-01-07T18:52:45.924488Z"
    },
    "papermill": {
     "duration": 0.136842,
     "end_time": "2022-01-07T18:52:45.926381",
     "exception": false,
     "start_time": "2022-01-07T18:52:45.789539",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colnames(bike_trip_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "dcf57315",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:52:46.172272Z",
     "iopub.status.busy": "2022-01-07T18:52:46.170721Z",
     "iopub.status.idle": "2022-01-07T18:52:46.200077Z",
     "shell.execute_reply": "2022-01-07T18:52:46.198345Z"
    },
    "papermill": {
     "duration": 0.150309,
     "end_time": "2022-01-07T18:52:46.200238",
     "exception": false,
     "start_time": "2022-01-07T18:52:46.049929",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 13</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>BD0A6FF6FFF9B921</td><td>electric_bike</td><td>2020-11-01 13:36:00</td><td>2020-11-01 13:45:40</td><td><span style=white-space:pre-wrap>Dearborn St &amp; Erie St    </span></td><td>110</td><td><span style=white-space:pre-wrap>St. Clair St &amp; Erie St   </span></td><td>211</td><td>41.89418</td><td>-87.62913</td><td>41.89443</td><td>-87.62338</td><td>casual</td></tr>\n",
       "\t<tr><td>96A7A7A4BDE4F82D</td><td>electric_bike</td><td>2020-11-01 10:03:26</td><td>2020-11-01 10:14:45</td><td>Franklin St &amp; Illinois St</td><td>672</td><td>Noble St &amp; Milwaukee Ave </td><td>29 </td><td>41.89096</td><td>-87.63534</td><td>41.90067</td><td>-87.66248</td><td>casual</td></tr>\n",
       "\t<tr><td>C61526D06582BDC5</td><td>electric_bike</td><td>2020-11-01 00:34:05</td><td>2020-11-01 01:03:06</td><td>Lake Shore Dr &amp; Monroe St</td><td>76 </td><td><span style=white-space:pre-wrap>Federal St &amp; Polk St     </span></td><td>41 </td><td>41.88098</td><td>-87.61675</td><td>41.87205</td><td>-87.62955</td><td>casual</td></tr>\n",
       "\t<tr><td>E533E89C32080B9E</td><td>electric_bike</td><td>2020-11-01 00:45:16</td><td>2020-11-01 00:54:31</td><td>Leavitt St &amp; Chicago Ave </td><td>659</td><td><span style=white-space:pre-wrap>Stave St &amp; Armitage Ave  </span></td><td>185</td><td>41.89550</td><td>-87.68201</td><td>41.91774</td><td>-87.69139</td><td>casual</td></tr>\n",
       "\t<tr><td>1C9F4EF18C168C60</td><td>electric_bike</td><td>2020-11-01 15:43:25</td><td>2020-11-01 16:16:52</td><td>Buckingham Fountain      </td><td>2  </td><td>Buckingham Fountain      </td><td>2  </td><td>41.87650</td><td>-87.62036</td><td>41.87645</td><td>-87.62034</td><td>casual</td></tr>\n",
       "\t<tr><td>7259585D8276D338</td><td>electric_bike</td><td>2020-11-14 15:55:17</td><td>2020-11-14 16:44:38</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; 16th St     </span></td><td>72 </td><td>Lake Shore Dr &amp; Monroe St</td><td>76 </td><td>41.86029</td><td>-87.62581</td><td>41.88099</td><td>-87.61677</td><td>casual</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 13\n",
       "\\begin{tabular}{lllllllllllll}\n",
       " ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual\\\\\n",
       " <chr> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t BD0A6FF6FFF9B921 & electric\\_bike & 2020-11-01 13:36:00 & 2020-11-01 13:45:40 & Dearborn St \\& Erie St     & 110 & St. Clair St \\& Erie St    & 211 & 41.89418 & -87.62913 & 41.89443 & -87.62338 & casual\\\\\n",
       "\t 96A7A7A4BDE4F82D & electric\\_bike & 2020-11-01 10:03:26 & 2020-11-01 10:14:45 & Franklin St \\& Illinois St & 672 & Noble St \\& Milwaukee Ave  & 29  & 41.89096 & -87.63534 & 41.90067 & -87.66248 & casual\\\\\n",
       "\t C61526D06582BDC5 & electric\\_bike & 2020-11-01 00:34:05 & 2020-11-01 01:03:06 & Lake Shore Dr \\& Monroe St & 76  & Federal St \\& Polk St      & 41  & 41.88098 & -87.61675 & 41.87205 & -87.62955 & casual\\\\\n",
       "\t E533E89C32080B9E & electric\\_bike & 2020-11-01 00:45:16 & 2020-11-01 00:54:31 & Leavitt St \\& Chicago Ave  & 659 & Stave St \\& Armitage Ave   & 185 & 41.89550 & -87.68201 & 41.91774 & -87.69139 & casual\\\\\n",
       "\t 1C9F4EF18C168C60 & electric\\_bike & 2020-11-01 15:43:25 & 2020-11-01 16:16:52 & Buckingham Fountain       & 2   & Buckingham Fountain       & 2   & 41.87650 & -87.62036 & 41.87645 & -87.62034 & casual\\\\\n",
       "\t 7259585D8276D338 & electric\\_bike & 2020-11-14 15:55:17 & 2020-11-14 16:44:38 & Wabash Ave \\& 16th St      & 72  & Lake Shore Dr \\& Monroe St & 76  & 41.86029 & -87.62581 & 41.88099 & -87.61677 & casual\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 13\n",
       "\n",
       "| ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| BD0A6FF6FFF9B921 | electric_bike | 2020-11-01 13:36:00 | 2020-11-01 13:45:40 | Dearborn St &amp; Erie St     | 110 | St. Clair St &amp; Erie St    | 211 | 41.89418 | -87.62913 | 41.89443 | -87.62338 | casual |\n",
       "| 96A7A7A4BDE4F82D | electric_bike | 2020-11-01 10:03:26 | 2020-11-01 10:14:45 | Franklin St &amp; Illinois St | 672 | Noble St &amp; Milwaukee Ave  | 29  | 41.89096 | -87.63534 | 41.90067 | -87.66248 | casual |\n",
       "| C61526D06582BDC5 | electric_bike | 2020-11-01 00:34:05 | 2020-11-01 01:03:06 | Lake Shore Dr &amp; Monroe St | 76  | Federal St &amp; Polk St      | 41  | 41.88098 | -87.61675 | 41.87205 | -87.62955 | casual |\n",
       "| E533E89C32080B9E | electric_bike | 2020-11-01 00:45:16 | 2020-11-01 00:54:31 | Leavitt St &amp; Chicago Ave  | 659 | Stave St &amp; Armitage Ave   | 185 | 41.89550 | -87.68201 | 41.91774 | -87.69139 | casual |\n",
       "| 1C9F4EF18C168C60 | electric_bike | 2020-11-01 15:43:25 | 2020-11-01 16:16:52 | Buckingham Fountain       | 2   | Buckingham Fountain       | 2   | 41.87650 | -87.62036 | 41.87645 | -87.62034 | casual |\n",
       "| 7259585D8276D338 | electric_bike | 2020-11-14 15:55:17 | 2020-11-14 16:44:38 | Wabash Ave &amp; 16th St      | 72  | Lake Shore Dr &amp; Monroe St | 76  | 41.86029 | -87.62581 | 41.88099 | -87.61677 | casual |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 BD0A6FF6FFF9B921 electric_bike 2020-11-01 13:36:00 2020-11-01 13:45:40\n",
       "2 96A7A7A4BDE4F82D electric_bike 2020-11-01 10:03:26 2020-11-01 10:14:45\n",
       "3 C61526D06582BDC5 electric_bike 2020-11-01 00:34:05 2020-11-01 01:03:06\n",
       "4 E533E89C32080B9E electric_bike 2020-11-01 00:45:16 2020-11-01 00:54:31\n",
       "5 1C9F4EF18C168C60 electric_bike 2020-11-01 15:43:25 2020-11-01 16:16:52\n",
       "6 7259585D8276D338 electric_bike 2020-11-14 15:55:17 2020-11-14 16:44:38\n",
       "  start_station_name        start_station_id end_station_name         \n",
       "1 Dearborn St & Erie St     110              St. Clair St & Erie St   \n",
       "2 Franklin St & Illinois St 672              Noble St & Milwaukee Ave \n",
       "3 Lake Shore Dr & Monroe St 76               Federal St & Polk St     \n",
       "4 Leavitt St & Chicago Ave  659              Stave St & Armitage Ave  \n",
       "5 Buckingham Fountain       2                Buckingham Fountain      \n",
       "6 Wabash Ave & 16th St      72               Lake Shore Dr & Monroe St\n",
       "  end_station_id start_lat start_lng end_lat  end_lng   member_casual\n",
       "1 211            41.89418  -87.62913 41.89443 -87.62338 casual       \n",
       "2 29             41.89096  -87.63534 41.90067 -87.66248 casual       \n",
       "3 41             41.88098  -87.61675 41.87205 -87.62955 casual       \n",
       "4 185            41.89550  -87.68201 41.91774 -87.69139 casual       \n",
       "5 2              41.87650  -87.62036 41.87645 -87.62034 casual       \n",
       "6 76             41.86029  -87.62581 41.88099 -87.61677 casual       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(bike_trip_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "0f9d5587",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:52:46.446651Z",
     "iopub.status.busy": "2022-01-07T18:52:46.445093Z",
     "iopub.status.idle": "2022-01-07T18:52:49.734315Z",
     "shell.execute_reply": "2022-01-07T18:52:49.732340Z"
    },
    "papermill": {
     "duration": 3.413798,
     "end_time": "2022-01-07T18:52:49.734502",
     "exception": false,
     "start_time": "2022-01-07T18:52:46.320704",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   ride_id          rideable_type        started_at                 \n",
       " Length:5378834     Length:5378834     Min.   :2020-11-01 00:00:08  \n",
       " Class :character   Class :character   1st Qu.:2021-05-17 12:45:18  \n",
       " Mode  :character   Mode  :character   Median :2021-07-13 22:33:14  \n",
       "                                       Mean   :2021-06-27 18:37:41  \n",
       "                                       3rd Qu.:2021-09-02 18:18:14  \n",
       "                                       Max.   :2021-10-31 23:59:49  \n",
       "                                                                    \n",
       "    ended_at                   start_station_name start_station_id  \n",
       " Min.   :2020-11-01 00:02:20   Length:5378834     Length:5378834    \n",
       " 1st Qu.:2021-05-17 13:07:36   Class :character   Class :character  \n",
       " Median :2021-07-13 22:57:23   Mode  :character   Mode  :character  \n",
       " Mean   :2021-06-27 18:58:10                                        \n",
       " 3rd Qu.:2021-09-02 18:35:16                                        \n",
       " Max.   :2021-11-03 21:45:48                                        \n",
       "                                                                    \n",
       " end_station_name   end_station_id       start_lat       start_lng     \n",
       " Length:5378834     Length:5378834     Min.   :41.64   Min.   :-87.84  \n",
       " Class :character   Class :character   1st Qu.:41.88   1st Qu.:-87.66  \n",
       " Mode  :character   Mode  :character   Median :41.90   Median :-87.64  \n",
       "                                       Mean   :41.90   Mean   :-87.65  \n",
       "                                       3rd Qu.:41.93   3rd Qu.:-87.63  \n",
       "                                       Max.   :42.08   Max.   :-87.52  \n",
       "                                                                       \n",
       "    end_lat         end_lng       member_casual     \n",
       " Min.   :41.51   Min.   :-88.07   Length:5378834    \n",
       " 1st Qu.:41.88   1st Qu.:-87.66   Class :character  \n",
       " Median :41.90   Median :-87.64   Mode  :character  \n",
       " Mean   :41.90   Mean   :-87.65                     \n",
       " 3rd Qu.:41.93   3rd Qu.:-87.63                     \n",
       " Max.   :42.17   Max.   :-87.44                     \n",
       " NA's   :4831    NA's   :4831                       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(bike_trip_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "ba095985",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:52:49.983493Z",
     "iopub.status.busy": "2022-01-07T18:52:49.981879Z",
     "iopub.status.idle": "2022-01-07T18:53:05.327020Z",
     "shell.execute_reply": "2022-01-07T18:53:05.325476Z"
    },
    "papermill": {
     "duration": 15.470577,
     "end_time": "2022-01-07T18:53:05.327230",
     "exception": false,
     "start_time": "2022-01-07T18:52:49.856653",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Include other important columns into data frame\n",
    "bike_trip_data$date <- as.Date(bike_trip_data$started_at) #add a date column\n",
    "bike_trip_data$month <- format(as.Date(bike_trip_data$started_at), \"%b %Y\") #add month-year column\n",
    "bike_trip_data$day <- format(as.Date(bike_trip_data$date), \"%d\") # add day column\n",
    "bike_trip_data$year <- format(as.Date(bike_trip_data$date), \"%Y\") # add year column\n",
    "bike_trip_data$day_of_week <- format(as.Date(bike_trip_data$date), \"%A\") #add day column\n",
    "bike_trip_data$time <- format(as.POSIXct(bike_trip_data$started_at), \"%H:%M\") # add time column\n",
    "# add column for length of each ride in minutes\n",
    "bike_trip_data$ride_length <- (as.double(difftime(bike_trip_data$ended_at, bike_trip_data$started_at)))/60 "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "89aa65da",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:53:05.577845Z",
     "iopub.status.busy": "2022-01-07T18:53:05.575512Z",
     "iopub.status.idle": "2022-01-07T18:53:05.603287Z",
     "shell.execute_reply": "2022-01-07T18:53:05.601356Z"
    },
    "papermill": {
     "duration": 0.154813,
     "end_time": "2022-01-07T18:53:05.603461",
     "exception": false,
     "start_time": "2022-01-07T18:53:05.448648",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'13:36'</li><li>'10:03'</li><li>'00:34'</li><li>'00:45'</li><li>'15:43'</li><li>'15:55'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item '13:36'\n",
       "\\item '10:03'\n",
       "\\item '00:34'\n",
       "\\item '00:45'\n",
       "\\item '15:43'\n",
       "\\item '15:55'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. '13:36'\n",
       "2. '10:03'\n",
       "3. '00:34'\n",
       "4. '00:45'\n",
       "5. '15:43'\n",
       "6. '15:55'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"13:36\" \"10:03\" \"00:34\" \"00:45\" \"15:43\" \"15:55\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "'character'"
      ],
      "text/latex": [
       "'character'"
      ],
      "text/markdown": [
       "'character'"
      ],
      "text/plain": [
       "[1] \"character\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(bike_trip_data$time)\n",
    "typeof(bike_trip_data$time)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "009ee8e1",
   "metadata": {
    "papermill": {
     "duration": 0.130318,
     "end_time": "2022-01-07T18:53:05.860501",
     "exception": false,
     "start_time": "2022-01-07T18:53:05.730183",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Process"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "9e6fc241",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:53:06.140799Z",
     "iopub.status.busy": "2022-01-07T18:53:06.138469Z",
     "iopub.status.idle": "2022-01-07T18:53:13.624858Z",
     "shell.execute_reply": "2022-01-07T18:53:13.622952Z"
    },
    "papermill": {
     "duration": 7.63147,
     "end_time": "2022-01-07T18:53:13.625035",
     "exception": false,
     "start_time": "2022-01-07T18:53:05.993565",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Data cleaning\n",
    "bike_trip_data <- distinct(bike_trip_data) # remove duplicate data entries\n",
    "bike_trip_data <- bike_trip_data[!bike_trip_data$ride_length<1,] # remove negative rides and rides less than 1 minute"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "6c923362",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:53:13.884281Z",
     "iopub.status.busy": "2022-01-07T18:53:13.882247Z",
     "iopub.status.idle": "2022-01-07T18:53:13.914963Z",
     "shell.execute_reply": "2022-01-07T18:53:13.913125Z"
    },
    "papermill": {
     "duration": 0.163452,
     "end_time": "2022-01-07T18:53:13.915140",
     "exception": false,
     "start_time": "2022-01-07T18:53:13.751688",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# rename columns poorly named\n",
    "bike_trip_data <- rename(bike_trip_data, customer_type = member_casual)\n",
    "bike_trip_data <- rename(bike_trip_data, bike_type = rideable_type)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "fc2469e0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:53:14.200963Z",
     "iopub.status.busy": "2022-01-07T18:53:14.198723Z",
     "iopub.status.idle": "2022-01-07T18:53:16.949228Z",
     "shell.execute_reply": "2022-01-07T18:53:16.947652Z"
    },
    "papermill": {
     "duration": 2.892091,
     "end_time": "2022-01-07T18:53:16.949403",
     "exception": false,
     "start_time": "2022-01-07T18:53:14.057312",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 10</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>bike_type</th><th scope=col>customer_type</th><th scope=col>started_at</th><th scope=col>date</th><th scope=col>month</th><th scope=col>day</th><th scope=col>year</th><th scope=col>day_of_week</th><th scope=col>time</th><th scope=col>ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>electric_bike</td><td>casual</td><td>2020-11-01 13:36:00</td><td>2020-11-01</td><td>Nov 2020</td><td>01</td><td>2020</td><td>Sunday  </td><td>13:36</td><td> 9.666667</td></tr>\n",
       "\t<tr><td>electric_bike</td><td>casual</td><td>2020-11-01 10:03:26</td><td>2020-11-01</td><td>Nov 2020</td><td>01</td><td>2020</td><td>Sunday  </td><td>10:03</td><td>11.316667</td></tr>\n",
       "\t<tr><td>electric_bike</td><td>casual</td><td>2020-11-01 00:34:05</td><td>2020-11-01</td><td>Nov 2020</td><td>01</td><td>2020</td><td>Sunday  </td><td>00:34</td><td>29.016667</td></tr>\n",
       "\t<tr><td>electric_bike</td><td>casual</td><td>2020-11-01 00:45:16</td><td>2020-11-01</td><td>Nov 2020</td><td>01</td><td>2020</td><td>Sunday  </td><td>00:45</td><td> 9.250000</td></tr>\n",
       "\t<tr><td>electric_bike</td><td>casual</td><td>2020-11-01 15:43:25</td><td>2020-11-01</td><td>Nov 2020</td><td>01</td><td>2020</td><td>Sunday  </td><td>15:43</td><td>33.450000</td></tr>\n",
       "\t<tr><td>electric_bike</td><td>casual</td><td>2020-11-14 15:55:17</td><td>2020-11-14</td><td>Nov 2020</td><td>14</td><td>2020</td><td>Saturday</td><td>15:55</td><td>49.350000</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 10\n",
       "\\begin{tabular}{llllllllll}\n",
       " bike\\_type & customer\\_type & started\\_at & date & month & day & year & day\\_of\\_week & time & ride\\_length\\\\\n",
       " <chr> & <chr> & <dttm> & <date> & <chr> & <chr> & <chr> & <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t electric\\_bike & casual & 2020-11-01 13:36:00 & 2020-11-01 & Nov 2020 & 01 & 2020 & Sunday   & 13:36 &  9.666667\\\\\n",
       "\t electric\\_bike & casual & 2020-11-01 10:03:26 & 2020-11-01 & Nov 2020 & 01 & 2020 & Sunday   & 10:03 & 11.316667\\\\\n",
       "\t electric\\_bike & casual & 2020-11-01 00:34:05 & 2020-11-01 & Nov 2020 & 01 & 2020 & Sunday   & 00:34 & 29.016667\\\\\n",
       "\t electric\\_bike & casual & 2020-11-01 00:45:16 & 2020-11-01 & Nov 2020 & 01 & 2020 & Sunday   & 00:45 &  9.250000\\\\\n",
       "\t electric\\_bike & casual & 2020-11-01 15:43:25 & 2020-11-01 & Nov 2020 & 01 & 2020 & Sunday   & 15:43 & 33.450000\\\\\n",
       "\t electric\\_bike & casual & 2020-11-14 15:55:17 & 2020-11-14 & Nov 2020 & 14 & 2020 & Saturday & 15:55 & 49.350000\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 10\n",
       "\n",
       "| bike_type &lt;chr&gt; | customer_type &lt;chr&gt; | started_at &lt;dttm&gt; | date &lt;date&gt; | month &lt;chr&gt; | day &lt;chr&gt; | year &lt;chr&gt; | day_of_week &lt;chr&gt; | time &lt;chr&gt; | ride_length &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|\n",
       "| electric_bike | casual | 2020-11-01 13:36:00 | 2020-11-01 | Nov 2020 | 01 | 2020 | Sunday   | 13:36 |  9.666667 |\n",
       "| electric_bike | casual | 2020-11-01 10:03:26 | 2020-11-01 | Nov 2020 | 01 | 2020 | Sunday   | 10:03 | 11.316667 |\n",
       "| electric_bike | casual | 2020-11-01 00:34:05 | 2020-11-01 | Nov 2020 | 01 | 2020 | Sunday   | 00:34 | 29.016667 |\n",
       "| electric_bike | casual | 2020-11-01 00:45:16 | 2020-11-01 | Nov 2020 | 01 | 2020 | Sunday   | 00:45 |  9.250000 |\n",
       "| electric_bike | casual | 2020-11-01 15:43:25 | 2020-11-01 | Nov 2020 | 01 | 2020 | Sunday   | 15:43 | 33.450000 |\n",
       "| electric_bike | casual | 2020-11-14 15:55:17 | 2020-11-14 | Nov 2020 | 14 | 2020 | Saturday | 15:55 | 49.350000 |\n",
       "\n"
      ],
      "text/plain": [
       "  bike_type     customer_type started_at          date       month    day year\n",
       "1 electric_bike casual        2020-11-01 13:36:00 2020-11-01 Nov 2020 01  2020\n",
       "2 electric_bike casual        2020-11-01 10:03:26 2020-11-01 Nov 2020 01  2020\n",
       "3 electric_bike casual        2020-11-01 00:34:05 2020-11-01 Nov 2020 01  2020\n",
       "4 electric_bike casual        2020-11-01 00:45:16 2020-11-01 Nov 2020 01  2020\n",
       "5 electric_bike casual        2020-11-01 15:43:25 2020-11-01 Nov 2020 01  2020\n",
       "6 electric_bike casual        2020-11-14 15:55:17 2020-11-14 Nov 2020 14  2020\n",
       "  day_of_week time  ride_length\n",
       "1 Sunday      13:36  9.666667  \n",
       "2 Sunday      10:03 11.316667  \n",
       "3 Sunday      00:34 29.016667  \n",
       "4 Sunday      00:45  9.250000  \n",
       "5 Sunday      15:43 33.450000  \n",
       "6 Saturday    15:55 49.350000  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "bike_data <- bike_trip_data %>% \n",
    "  select(bike_type, customer_type, started_at, date, month, day, year, day_of_week, time, ride_length)\n",
    "\n",
    "invisible(drop_na(bike_data)) # remove rows with missing values\n",
    "head(bike_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "19ac7e18",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:53:17.216688Z",
     "iopub.status.busy": "2022-01-07T18:53:17.214916Z",
     "iopub.status.idle": "2022-01-07T18:53:17.417796Z",
     "shell.execute_reply": "2022-01-07T18:53:17.416321Z"
    },
    "papermill": {
     "duration": 0.336473,
     "end_time": "2022-01-07T18:53:17.417977",
     "exception": false,
     "start_time": "2022-01-07T18:53:17.081504",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Order data for day of the week\n",
    "bike_data$day_of_week <- factor(bike_data$day_of_week, levels=c(\"Monday\", \"Tuesday\", \"Wednesday\", \"Thursday\", \"Friday\", \n",
    "                                                                \"Saturday\", \"Sunday\"))\n",
    "bike_data$month <- factor(bike_data$month, levels=c(\"Nov 2020\", \"Dec 2020\", \"Jan 2021\", \"Feb 2021\", \"Mar 2021\", \"Apr 2021\", \n",
    "                                                    \"May 2021\", \"Jun 2021\", \"Jul 2021\", \"Aug 2021\", \"Sep 2021\", \"Oct 2021\"))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1d99eb3a",
   "metadata": {
    "papermill": {
     "duration": 0.142797,
     "end_time": "2022-01-07T18:53:17.692326",
     "exception": false,
     "start_time": "2022-01-07T18:53:17.549529",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Analyze\n",
    "##### Since the business task is focused on understanding how annual members and casual riders use Cyclistic bikes differently,\n",
    "##### our analysis will compare data for members vs casual riders"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "6abd201e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:53:17.974235Z",
     "iopub.status.busy": "2022-01-07T18:53:17.972445Z",
     "iopub.status.idle": "2022-01-07T18:53:18.838685Z",
     "shell.execute_reply": "2022-01-07T18:53:18.837227Z"
    },
    "papermill": {
     "duration": 1.00376,
     "end_time": "2022-01-07T18:53:18.838967",
     "exception": false,
     "start_time": "2022-01-07T18:53:17.835207",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. \n",
       "    1.00     7.18    12.58    22.84    22.67 55944.15 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(bike_data$ride_length) # summary stats for overall ride length"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "8a45abae",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:53:19.107860Z",
     "iopub.status.busy": "2022-01-07T18:53:19.106177Z",
     "iopub.status.idle": "2022-01-07T18:53:19.400810Z",
     "shell.execute_reply": "2022-01-07T18:53:19.398808Z"
    },
    "papermill": {
     "duration": 0.431284,
     "end_time": "2022-01-07T18:53:19.400979",
     "exception": false,
     "start_time": "2022-01-07T18:53:18.969695",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       " casual  member \n",
       "2437162 2859625 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "table(bike_data$customer_type) # show total number of members and casual riders"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "eb4a152b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:53:19.678908Z",
     "iopub.status.busy": "2022-01-07T18:53:19.677276Z",
     "iopub.status.idle": "2022-01-07T18:53:23.089157Z",
     "shell.execute_reply": "2022-01-07T18:53:23.087703Z"
    },
    "papermill": {
     "duration": 3.551447,
     "end_time": "2022-01-07T18:53:23.089317",
     "exception": false,
     "start_time": "2022-01-07T18:53:19.537870",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>customer_type</th><th scope=col>ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>32.99322</td></tr>\n",
       "\t<tr><td>member</td><td>14.18907</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " customer\\_type & ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 32.99322\\\\\n",
       "\t member & 14.18907\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| customer_type &lt;chr&gt; | ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 32.99322 |\n",
       "| member | 14.18907 |\n",
       "\n"
      ],
      "text/plain": [
       "  customer_type ride_length\n",
       "1 casual        32.99322   \n",
       "2 member        14.18907   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(ride_length ~ customer_type, bike_data, mean) # average length of rides by customer type (mins)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "720fe7a1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:53:23.367494Z",
     "iopub.status.busy": "2022-01-07T18:53:23.365989Z",
     "iopub.status.idle": "2022-01-07T18:53:27.330064Z",
     "shell.execute_reply": "2022-01-07T18:53:27.328537Z"
    },
    "papermill": {
     "duration": 4.106129,
     "end_time": "2022-01-07T18:53:27.330230",
     "exception": false,
     "start_time": "2022-01-07T18:53:23.224101",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>customer_type</th><th scope=col>ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>16.61667</td></tr>\n",
       "\t<tr><td>member</td><td>10.08333</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " customer\\_type & ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 16.61667\\\\\n",
       "\t member & 10.08333\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| customer_type &lt;chr&gt; | ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 16.61667 |\n",
       "| member | 10.08333 |\n",
       "\n"
      ],
      "text/plain": [
       "  customer_type ride_length\n",
       "1 casual        16.61667   \n",
       "2 member        10.08333   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(ride_length ~ customer_type, bike_data, median) # median length of rides by customer type (mins)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "4d6fcef0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:53:27.614260Z",
     "iopub.status.busy": "2022-01-07T18:53:27.612578Z",
     "iopub.status.idle": "2022-01-07T18:53:30.722240Z",
     "shell.execute_reply": "2022-01-07T18:53:30.720752Z"
    },
    "papermill": {
     "duration": 3.253308,
     "end_time": "2022-01-07T18:53:30.722405",
     "exception": false,
     "start_time": "2022-01-07T18:53:27.469097",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>customer_type</th><th scope=col>ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>80409822</td></tr>\n",
       "\t<tr><td>member</td><td>40575431</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " customer\\_type & ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 80409822\\\\\n",
       "\t member & 40575431\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| customer_type &lt;chr&gt; | ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 80409822 |\n",
       "| member | 40575431 |\n",
       "\n"
      ],
      "text/plain": [
       "  customer_type ride_length\n",
       "1 casual        80409822   \n",
       "2 member        40575431   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(ride_length ~ customer_type, bike_data, sum) # total length of rides by customer type (mins)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "95f65ab3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:53:31.013146Z",
     "iopub.status.busy": "2022-01-07T18:53:31.011060Z",
     "iopub.status.idle": "2022-01-07T18:53:35.980446Z",
     "shell.execute_reply": "2022-01-07T18:53:35.978969Z"
    },
    "papermill": {
     "duration": 5.116546,
     "end_time": "2022-01-07T18:53:35.980612",
     "exception": false,
     "start_time": "2022-01-07T18:53:30.864066",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 14 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>customer_type</th><th scope=col>day_of_week</th><th scope=col>ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>32.74802</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td>13.73542</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>29.00476</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td>13.30200</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>28.53208</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td>13.36684</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>28.57511</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td>13.30194</td></tr>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td>31.32545</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td>13.88167</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>35.62804</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td>15.83642</td></tr>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>38.61907</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td>16.20796</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 14 × 3\n",
       "\\begin{tabular}{lll}\n",
       " customer\\_type & day\\_of\\_week & ride\\_length\\\\\n",
       " <chr> & <fct> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Monday    & 32.74802\\\\\n",
       "\t member & Monday    & 13.73542\\\\\n",
       "\t casual & Tuesday   & 29.00476\\\\\n",
       "\t member & Tuesday   & 13.30200\\\\\n",
       "\t casual & Wednesday & 28.53208\\\\\n",
       "\t member & Wednesday & 13.36684\\\\\n",
       "\t casual & Thursday  & 28.57511\\\\\n",
       "\t member & Thursday  & 13.30194\\\\\n",
       "\t casual & Friday    & 31.32545\\\\\n",
       "\t member & Friday    & 13.88167\\\\\n",
       "\t casual & Saturday  & 35.62804\\\\\n",
       "\t member & Saturday  & 15.83642\\\\\n",
       "\t casual & Sunday    & 38.61907\\\\\n",
       "\t member & Sunday    & 16.20796\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 14 × 3\n",
       "\n",
       "| customer_type &lt;chr&gt; | day_of_week &lt;fct&gt; | ride_length &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| casual | Monday    | 32.74802 |\n",
       "| member | Monday    | 13.73542 |\n",
       "| casual | Tuesday   | 29.00476 |\n",
       "| member | Tuesday   | 13.30200 |\n",
       "| casual | Wednesday | 28.53208 |\n",
       "| member | Wednesday | 13.36684 |\n",
       "| casual | Thursday  | 28.57511 |\n",
       "| member | Thursday  | 13.30194 |\n",
       "| casual | Friday    | 31.32545 |\n",
       "| member | Friday    | 13.88167 |\n",
       "| casual | Saturday  | 35.62804 |\n",
       "| member | Saturday  | 15.83642 |\n",
       "| casual | Sunday    | 38.61907 |\n",
       "| member | Sunday    | 16.20796 |\n",
       "\n"
      ],
      "text/plain": [
       "   customer_type day_of_week ride_length\n",
       "1  casual        Monday      32.74802   \n",
       "2  member        Monday      13.73542   \n",
       "3  casual        Tuesday     29.00476   \n",
       "4  member        Tuesday     13.30200   \n",
       "5  casual        Wednesday   28.53208   \n",
       "6  member        Wednesday   13.36684   \n",
       "7  casual        Thursday    28.57511   \n",
       "8  member        Thursday    13.30194   \n",
       "9  casual        Friday      31.32545   \n",
       "10 member        Friday      13.88167   \n",
       "11 casual        Saturday    35.62804   \n",
       "12 member        Saturday    15.83642   \n",
       "13 casual        Sunday      38.61907   \n",
       "14 member        Sunday      16.20796   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(ride_length ~ customer_type + day_of_week, bike_data, mean) # summary of average length of rides by customer type and day of the week"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "898d745b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:53:36.306267Z",
     "iopub.status.busy": "2022-01-07T18:53:36.304053Z",
     "iopub.status.idle": "2022-01-07T18:53:36.643373Z",
     "shell.execute_reply": "2022-01-07T18:53:36.641651Z"
    },
    "papermill": {
     "duration": 0.489726,
     "end_time": "2022-01-07T18:53:36.643546",
     "exception": false,
     "start_time": "2022-01-07T18:53:36.153820",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'customer_type'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 14 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>customer_type</th><th scope=col>day_of_week</th><th scope=col>total_rides</th><th scope=col>average_rides</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>274566</td><td>32.74802</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td>384949</td><td>13.73542</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>260698</td><td>29.00476</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td>424869</td><td>13.30200</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>263823</td><td>28.53208</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td>437385</td><td>13.36684</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>273681</td><td>28.57511</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td>418983</td><td>13.30194</td></tr>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td>350193</td><td>31.32545</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td>418227</td><td>13.88167</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>544459</td><td>35.62804</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td>413550</td><td>15.83642</td></tr>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>469742</td><td>38.61907</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td>361662</td><td>16.20796</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 14 × 4\n",
       "\\begin{tabular}{llll}\n",
       " customer\\_type & day\\_of\\_week & total\\_rides & average\\_rides\\\\\n",
       " <chr> & <fct> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Monday    & 274566 & 32.74802\\\\\n",
       "\t member & Monday    & 384949 & 13.73542\\\\\n",
       "\t casual & Tuesday   & 260698 & 29.00476\\\\\n",
       "\t member & Tuesday   & 424869 & 13.30200\\\\\n",
       "\t casual & Wednesday & 263823 & 28.53208\\\\\n",
       "\t member & Wednesday & 437385 & 13.36684\\\\\n",
       "\t casual & Thursday  & 273681 & 28.57511\\\\\n",
       "\t member & Thursday  & 418983 & 13.30194\\\\\n",
       "\t casual & Friday    & 350193 & 31.32545\\\\\n",
       "\t member & Friday    & 418227 & 13.88167\\\\\n",
       "\t casual & Saturday  & 544459 & 35.62804\\\\\n",
       "\t member & Saturday  & 413550 & 15.83642\\\\\n",
       "\t casual & Sunday    & 469742 & 38.61907\\\\\n",
       "\t member & Sunday    & 361662 & 16.20796\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 14 × 4\n",
       "\n",
       "| customer_type &lt;chr&gt; | day_of_week &lt;fct&gt; | total_rides &lt;int&gt; | average_rides &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| casual | Monday    | 274566 | 32.74802 |\n",
       "| member | Monday    | 384949 | 13.73542 |\n",
       "| casual | Tuesday   | 260698 | 29.00476 |\n",
       "| member | Tuesday   | 424869 | 13.30200 |\n",
       "| casual | Wednesday | 263823 | 28.53208 |\n",
       "| member | Wednesday | 437385 | 13.36684 |\n",
       "| casual | Thursday  | 273681 | 28.57511 |\n",
       "| member | Thursday  | 418983 | 13.30194 |\n",
       "| casual | Friday    | 350193 | 31.32545 |\n",
       "| member | Friday    | 418227 | 13.88167 |\n",
       "| casual | Saturday  | 544459 | 35.62804 |\n",
       "| member | Saturday  | 413550 | 15.83642 |\n",
       "| casual | Sunday    | 469742 | 38.61907 |\n",
       "| member | Sunday    | 361662 | 16.20796 |\n",
       "\n"
      ],
      "text/plain": [
       "   customer_type day_of_week total_rides average_rides\n",
       "1  casual        Monday      274566      32.74802     \n",
       "2  member        Monday      384949      13.73542     \n",
       "3  casual        Tuesday     260698      29.00476     \n",
       "4  member        Tuesday     424869      13.30200     \n",
       "5  casual        Wednesday   263823      28.53208     \n",
       "6  member        Wednesday   437385      13.36684     \n",
       "7  casual        Thursday    273681      28.57511     \n",
       "8  member        Thursday    418983      13.30194     \n",
       "9  casual        Friday      350193      31.32545     \n",
       "10 member        Friday      418227      13.88167     \n",
       "11 casual        Saturday    544459      35.62804     \n",
       "12 member        Saturday    413550      15.83642     \n",
       "13 casual        Sunday      469742      38.61907     \n",
       "14 member        Sunday      361662      16.20796     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Compare summary stat for ridership based on customer type and broken down by day of the week\n",
    "bike_data %>% \n",
    "  group_by(customer_type, day_of_week) %>% \n",
    "  summarise(total_rides = n(), average_rides = mean(ride_length)) %>% \n",
    "  arrange(day_of_week)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5fe86cc4",
   "metadata": {
    "papermill": {
     "duration": 0.152426,
     "end_time": "2022-01-07T18:53:36.944962",
     "exception": false,
     "start_time": "2022-01-07T18:53:36.792536",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Share\n",
    "#### Data visualization"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "dc4d9666",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:53:37.253077Z",
     "iopub.status.busy": "2022-01-07T18:53:37.251469Z",
     "iopub.status.idle": "2022-01-07T18:53:38.149400Z",
     "shell.execute_reply": "2022-01-07T18:53:38.148305Z"
    },
    "papermill": {
     "duration": 1.051893,
     "end_time": "2022-01-07T18:53:38.149551",
     "exception": false,
     "start_time": "2022-01-07T18:53:37.097658",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'customer_type'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nN2X1OOuFCnmfmZ5O2QCQaTnuiaxPnNj7BxIsFk/fZoYU40HBjQPl8M1Lx+5KxYC0Fo+PvLhi\n4bK9B4+cOXv+4qWLV0OzdNvE9INHO+V2T9piMUd+Paldm9FbhjRv0y/i55Q3yzw4d1ZEcj9T\nK1m7onNvF+A+89qjy7oToi9ciI4XueWaxrjXveP3rC9G7/zyt6bddm6d12LrPKNnnsrVa9Zt\n0Kh1++71QvxUboWtu9S3qq/KNauX4XGJubtLRNwCWiVr1xkDihT5z+H2r+af7eXF3tsnIkbP\nCuoLFhGDe5lxJX2Hn/z9o4v3RhXL9eDa3G9uR/kGj6vv7ZJ6L1l7b6uU/v5R/8ZLlVtAm8qe\nLkcenF8bFtUidv756PjclUYnPvO5/Ih6sv787x8elOcK/fjVJRGpOSjEpn5tLe+9jmNNuRsE\n3f/57L7B7/3ccXLdvOkUDwCZQLDLuhRfS/QvRa+IiDk2zQdw3P59UY0G/c4/iAsIrtqwVo36\nLTsGlSxTrvieGjWnZ1dxis79lVGbq01xP3zvlw23otoGJH92nWJURERS+1TyMz7OgRZLnIgY\nXIsOGdQh1Y7y1sxtfeFZ5MUdp24e+mH95i3bf/x536Efv/119zczxg17ccS6TZNeUle1bbvU\n4JbNb2M1x8VijhYRRZ9x1zqX7L/3/Op3u0XEO6iL+oKt2n1YY3ib75dP+GPUF/X/GDdPROpN\n6552P5l/b6uX/v5R/8ZLy/Byfh0O3Fh6OKzMsVUiUnpw/cRJ/uXGmHRf3vp9otny8uwr9xVF\nN7yMr0392lqei3+d749tzbulS8nu62e+1OXdmz8EGHg0AYBs5ewhwydDuqdiz+oVxeAWFJ9i\n0le184rIq4duWn9MeSqqfaCHiLyz8lDSpSIujJTMnopN67n244p4i8iYS4/ujUh6KvbO2XdE\nxLfkjJRL1fc2SeKpWHNsbqNe75LH1q+GiI+8ue3LD3Mb9YqirAhN/R7GFKdi1e5S66lYlV9d\noP5UrJrj8vDm/0TEM/+AZMvGRZ5Yvnz52s3nLGl/s0KWT8Um9MrnKSIvf3tJfcGPynt4zFWn\nmLzrJZhja3i56I3+l6NT7uZH1B+IrJyKzWD/ZPaNl+jc2sYiUqT5tsklfERk9X/fhEMKeonI\nnL++kGQ3kajsV3V51lOxnzz69pf4N0v6iEjV4XszWAwAbMQ/i1mldy3RLdA9Purs8AM3k7bH\n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\nHruVpEHQuQAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Figure 1: Total Rides for Each Day of the Week\n",
    "bike_data %>% \n",
    "  group_by(customer_type, day_of_week) %>% \n",
    "  summarise(total_number_of_rides = n()) %>% \n",
    "  ggplot(aes(x = day_of_week, y = total_number_of_rides, fill = customer_type)) + geom_col(position = \"dodge\") + \n",
    "  scale_y_continuous(labels = scales::comma) + scale_fill_manual(values = c(\"#DC3220\", \"#005AB5\")) +\n",
    "  labs(x = 'Day of Week', y = 'Total Number of Rides', title = 'Total Rides for Each Day of the Week',\n",
    "       fill = \"Type of Customer\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "30ea2397",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:53:38.461654Z",
     "iopub.status.busy": "2022-01-07T18:53:38.458803Z",
     "iopub.status.idle": "2022-01-07T18:53:39.521321Z",
     "shell.execute_reply": "2022-01-07T18:53:39.142354Z"
    },
    "papermill": {
     "duration": 1.221267,
     "end_time": "2022-01-07T18:53:39.521530",
     "exception": false,
     "start_time": "2022-01-07T18:53:38.300263",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'customer_type'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdeZxN9R/H8c+569w7+2LfGRlEyJp9S0qolFC2UCFtSClbotVOJKlfGy2iQhKh\nIkWLsmWNSJZZzHbv3O33x9U1ZnNn5s6cmdPr+UePO997zve+750717tzz6J4PB4BAABA6adT\nOwAAAAACg2IHAACgERQ7AAAAjaDYAQAAaATFDgAAQCModgAAABpBsQMAANAIih0AAIBGUOxy\n9sOjDRQ/9Pz1XDGE2fNCM0VROq85nscy9YNN2ePpdIbQiDKN2948/fUv3ZkW3v1kI0VRum89\nnffjzq4VqSjKugRbAJ5DiRR/cID3hYqqMyPXhdy2uH9f26+T7MUT7NBb7RRFaffWoeJ5OACA\nZhjUDlBCBcVUjY29XGg87tQjR/9WFEOtWtUzL1bBrPd/To87dfuOXwzmqi2aVglUzizK1agV\nqld8P7qdGRdOn/rl2/W/fLv+/c2L9r73YBE9bmmXeHja3rTx9a05/DkkHJ56MM1RpI9eDG8M\nAMB/BMUuZw0nrj008fKPtoR1lqhbdMYyhw4VfCOKM/2PNm3ahFV9JunPaQGImJNZO/f0L2PN\nPOJxXfxo5qC7nlm97/2RM57t/1StcBGpfuezb8bFV4qLLKIYpYuiM3jc9nFf/rWud/Xs9/40\n6UMRMeoUh7uoLr5XDG8MAMB/BF/FapyiD7vz6U9GVQwRkRWL/vAORje5ddCgQV3KWVSNVlKE\n13hCryg/TFyVw30e54R1J81hrTpHmIs9FwAA+Uax+0+4s205EUnck6h2kKtzZ9hcgd005rGf\ndbjzuN8U2nJs1dCEg88cSndmueviiZd3JWdU7TVDL0qO6+aHO9WWdX4AAAKLYhco7q3vzOzZ\nrmGZiBBTcHiNa28YOXnpabvLd/eKujGmkCYicvHEs4qiRNdZ7h33uJLee2Vs5+b1osODDSZL\nmSrXdB8wZsOBpACHs7tFJKRWiPfHX6Zen+XgCbfj7NJn7m92TZUQszmmYs3bh0/8LTEjx6n+\n/Pa9wb07VCobabZG1G7QbOTUxYfTsvaV+N/Xjul3U2yFaLPRFB5duW2PISt2nskj3kOVQo2W\nWo7kvY/2ahVuDTbqDZHlqnTrN3rToYsFCHBgSWtFUUYfSUz5c93dbeuFmKxvn03L+/UZMrGh\n25U2dkvWo0l+e+4tEek3uXFOK13lNy7/HgNx36GEXW9PvLZyRIjFaDAH12jY9uklG33L5PbG\n8Eo+snHYbe3KRYcZg4KrN2j91KINeT8RAMB/nQd+SI9fKyJ6U4XcFph773UioihKuZoN2rVq\nGmnUi0h4bM+9qQ7vAr/Mmjb+8SEiYg5rPWHChGmv7PJ4PG7nxeHNy4qIzhBxXdNW7W9oVj3S\n7H2gT8+l+Sb/9fmmItJp9bE8EtazGkXk3bOpOd3pvLusVUQGffO39+efpzQRkZu2nLp0t+14\n37qRvvxxlcJFJCiq9aBywSKyNj7dN9GO2QP1iqIoSrnq9Vq3uC4m2CAiwZU6bfrnctpzu2dF\nGHQiElWzfpv2bepVDxcRnT5k3r743MKPrhiiN1UYeE2EiBisZa5rHBdi0ImI3lR2/g9nMy/p\nT4D9i28QkWE/bWgUZrKUu6bLzbeuuZCe7TE9Ho/nwoH+IlK20We2xK91ihLTcH6WBTpHBBmD\nG9jdnluiLCKyOdHmu+uqv3GPx/PHm21FpPPLgxVFCa4Q2/nWXm2aVPf+3fWY+5t3mRzfGN4V\nr33imUpmfUjF2l1u7dW2SdV/V/w9t5cRAACKnV/yLnbHPr5HRMzhzdbsOe8dyUj+47EOFUSk\nWo+3fItlpPwkImFVn/GNnPr6ThEJrdrnQPylxuB2Ji8Zco2INBj7g2+xghc7V8bpQ7tmDG0q\nImVbPmJ3XxrOUuxW31NbRMJr3bb1WJJ35OT379W1Gr1Nwlfsko4uMusUU0iD1746fGl6x/lX\nR7cUkfDYEa5/H3NstTARuXfpdl+Izya2EJGyTV7PLfzoiiEioii6wXPWeUO67OdfHX2DiJjD\n28Q73PkK4C12ZWuEdHryvTSXO/vD+fiKncfjGVMpVGcIO25z+u5NOb1IRGr0Xu/xZC12fv7G\nvf1MRFo/9r/0f/Ntm9dTRCzRt/oWy/7G8K14w+Pv+H5rPyzrLyLWmD55PCMAwH8cxc4veRe7\nYRVDROTR785kHnSk7a9o1iu6oF9SMrwj2f/9Pvz2I717937yq1OZV0w8OlZEqt600Tfif7HL\nzQ0PvHzO4Ws+VxQ7Z/rRcINO0QWty7SN0OPxnFg/JEuxW96mgoiM3HL6igd2O+4tFywii/9O\n8Q7UthhF5FD65Q1XGSk/T5kyZcbLq3ML7y12VW5648ph1+ia4SLSd9Nf+QrgLXbWMn1dnqvI\nXOx+n9tSRPp89Zfv3h/HNRSRR/de8GQrdn7+xr39zBpze0bmeum2RRl1enPFTK9PzsXOEt3L\nfsWK9nCDzmCpebWnBQD472Ifu8Jy2Y4t/zvVYKn1YqtymccNlriXG8R43LZXDue6w1yte2Z/\n8sknMzpX9I3YE058NO+LAocpV6NWbGa1akRbDCKye8UbK3bmfC7liydfSnK6I2o+2z3mioNk\nK9+4oNIVZ+lzT9t1Tm+MmdWuwhXrK4ZRd1YXkfe3XtqL7raKwSLS9fZH1u3Yl+ERETEGN5o8\nefKTj/fKO/xtc3pfOaAbO6e5iHw/a3++AnhV7TUmX2/uWvc+IyLbnljnG3l++WGDpeaz2U4K\nk9/feLU+Y42ZD71QzOWNevFc/QiRaneMN12xoinaoJOiOukKAEALKHaFlZH8vcvjCYrsbsh2\n3GTtTuVE5M+9eR2L6kw7/tbcZ4f2v71t80ZVykUERVUbNuf3AoeZtXPPocwOHz2XkvTxszfb\nE/eNvfmOHA8NTTlyWETK3NAyy7iis94Zc/mUeC7bsWM2p8txPkiX9foWLRfsFZGL+y4d6PDM\npv91rh1xfP3CW26oHxJWrkWnno9Pnf3Ngfirhu9ZzpplJKpRRxG5ePBAvgJ4RV6fv7P0BUXe\nfF/54PO/PnE6wy0i6edWfHw+rULbl4N1WX+v+f2NRzSIyFcSn+im0QVbEQDwn8UJigsv100o\nil4REXdGrufauPDT683bjzya4oipfX2Hls3b9egXe029a2tuad5iVqDCKTrr7U9/2vRF666L\n3606n94nJuu56xTv1qSczuYRZbzc+z0eh4gYgqqPfeTuHB+ofIsy3hsh1W796uA/P3758afr\nNm77dvuP2z7/4evPZk8df+uEj9bMyGujXbYGJYrOJCIed0a+AngZLPl+b495pO6yCbvGfv/P\ne+0q/PH6yyLSfWabnBbM329c0RfwVCk6E//fBQDIH4pdYZlCW+gVxZbwhUsky/XFjm75R0Qq\nXpvrBptRNz9yNMXx6Hs/zurX1Dd48fjOQGfU3xpl2ZWc8Xuao49kLXYh1euLfHluxy6RrCXm\nq0xXiTUE1Spj1Me702bMnHn1nqKYmnXr16xbPxFxpZ/d9NHr99w36bPnb3vv0dT+ZXI9K/Jn\n/6R1DL/iPMCJ+74WkeAqcfkOUCC175sgE/p8/cSXsmPQ/HkH9KYKMxvGZF+sML9xAACKFJsE\nCksfVGtgOasz/fAT3/+TedyZ/sdjP51XdKbH6+T8naDHlfTB2TSDuWrmViciF//YF/CQkQad\niJy0ubLfFVr50SijLvHIUxsv2DKPx/82Y1vma94rxifqRLgyzk7cefbKCdyjr6tVoUKFNRds\nIpJ29p3atWs3bPmY7269peyN9z41r3akx+PZmGCT3K16/PMrBzzzx2wXkSaP1/c/QGFYYu7o\nX9Z67qfxJ8+uX3YmtWyzl6Kyf9taiN84AABFjWIXAM/MvVVEFnTvtW7/pZ2rnKlHn+zR8S+7\ns8pNi5uHXnG8qsd1aVcwRR9aI0jvyjj5xt4E370/fjSry22fi4gr21UQCsP7nd4/Cfbsd+nN\nVd7qF+txpd91w8Adf6V6BxP2r+/VcXqWJQcuf0BEXunSdcUPf//7XJLfHtt54Z6j9rC7ekUH\niUhQ5I2Jfx77/Yd5k9Zc3lPw/N7PJx9LUhTDwGx70WV2Yu2Q+1/d5O2eHmfSG2M7v3ggwRTS\neOlNVfwPUEhjH6jjyjh754SHRKTTC51yWyxfv3E/+d4YAAAUnNqH5ZYOVztBsXvWgAYioij6\nynWatGtWz3t+3fDYXvvTLp/1w+U4b9YpimLsdsfd943+yuPxbJ/UXkR0+uA2N956V++brrum\nnE4f0u+JCd7HGvzgKO9p2Ap9gmLP+naVRCRuxBbvj9lPUHxXXIQ3f6VrGl8XW15RFHNE87mD\na8uVJyj+ZHxX79umesPmnTu2rhUTJCLm8Mbrzlx+3B1Tb/QuUzb2uk5dOjdrGKtTFBHpMmFD\nbuG9pzsZM/gGETGFV2ravEGkWS8iemP0K99ecUoRfwJ4T3fS9s0/8ni5vDKf7sQr9Z+3vPPr\nDJGn7ZfPl5LtBMV+/ca9Zy25YfH+LI9bz2rM/F7K/sbwrpj9KdQMMhiCON0JACBXbLELCOXR\nd37Z9Nb0m2+om3Z6//bfTkbVbv7ApCX79q6Ky7QLv84Q/eWMYVXLWDeuWfXNb/Ei0mrq5s/n\nPtEiLnr3lnXrtv4UXLvrqp//fO/5mQsGtQ/Rnfvwg0+dATq3RZ0x9UTkjzd6vfVPDhfX0pur\nvf/r/lefGt4ktnzi8d+OJ+lvuuex749ua5ntyve9X/jy508X3tm1eerJfVu/3Z0Sdk3/h5/7\n6c/vu2faFNdy0obv3n2xZ9smnnOHt27eeuCvtJZd+y5c/fPGmTfmHXLwgi3fLBl/fQXd/l/2\nu0LLdb7zgc9/OfxY6ytOKeJPgMKwlh3YK9oiIjENn6+Q17ELfv3G/ZT9jQEAQMEoHj/OpwUU\nqYcqhS44nfJTSkbj4IJ8iQkAALzYYgcAAKARFDsAAACNoNgBAABoBCcohvr6v7ywUZqjqll/\n9UUBAEDuOHgCAABAI/gqFgAAQCModgAAABpBsQMAANAIih0AAIBGUOwAAAA0gmIHAACgERQ7\nAAAAjaDYAQAAaARXnsiBx+O5ePFiACcMCgrS6/VOp9Nutwdw2gKwWCw6nc7hcGRkZKibJDg4\nWETsdrvT6VQxhqIoVqtVRGw2m8vlUjGJTqezWCwikp6e7na7VUxiMBjMZrOIpKamqhhDRIxG\no8lk8ng8aWlp6iYxmUxGo9Htdqenp6ubxPth4nK5bDabuklKzoeJ1WpVFCUjI8PhcKibpIg+\n1sLDwwM4GzSPYpcDj8cT2A8Iq9VqMBhcLpfqnzshISF6vb4kfALq9XpFUWw2m7pJdDqdwWAQ\nEdV/OwaDwZvE6XSqXjF9SdS9Mo33NXG73aq/XU0mk8FgcDqdqiexWCwl5DUJDg42GAwOh0P1\nJHq9XqfT2e12dZMoiuL9w0lPT1f9NcF/GV/FAgAAaATFDgAAQCModgAAABpBsQMAANAIih0A\nAIBGUOwAAAA0gmIHAACgERQ7AAAAjaDYAQAAaISi7pnlSya3263TUXkBACqz2+3eS/wBfuKS\nYjlLTEwM4GwhISEGgyEjI0P1S16GhYXpdDqbzab6hSYjIiJEJC0tTd0LTep0urCwMBFJSUlR\n96q1er0+NDRURJKTk9W9pJjRaPRe8jIpKUnd//Ezm80Wi8Xj8SQlJakYQ0QsFovZbHa5XMnJ\nyeomCQ4ONhqNDodD9Sv5hoaG6vV6u92u+vVzw8PDFUVJT09X92LciqJ4L+qampoawEuKeTwe\nih3yhWKXs8D+G+/919Hj8ahbHXxJ3G53SUiiKIrqSXybZl0ul+qviZfq14rV6/W+JOoWO6PR\nKCXjD8ftdpeQJHyY5JikJHyYKIrivaF6EvzH8YUjAACARlDsAAAANIJiBwAAoBEUOwAAAI2g\n2AEAAGgExQ4AAEAjKHYAAAAaQbEDAADQCIodAACARlDsAAAANIJiBwAAoBEUOwAAAI2g2AEA\nAGgExQ4AAEAjKHYAAAAaQbEDAADQCIodAACARlDsAAAANMKgdgAA+G9J6tas4OuKiEiVHQcD\nFQaAxrDFDgAAQCModgAAABpBsQMAANAIih0AAIBGUOwAAAA0gmIHAACgERQ7AAAAjaDYAQAA\naATFDgAAQCModgAAABpBsQMAANAIih0AAIBGUOwAAAA0gmIHAACgERQ7AAAAjaDYAQAAaATF\nDgAAQCModgAAABpBsQMAANAIih0AAIBGUOwAAAA0gmIHAACgERQ7AAAAjaDYAQAAaATFDgAA\nQCModgAAABpBsQMAANAIih0AAIBGUOwAAAA0gmIHAACgERQ7AAAAjaDYAQAAaATFDgAAQCMo\ndgAAABpBsQMAANAIih0AAIBGUOwAAAA0gmIHAACgERQ7AAAAjaDYAQAAaIRB7QAAAHUkdWtW\n8HVFRKTit/sCFQZAQLDFDgAAQCModgAAABpBsQMAANAIih0AAIBGqFDsbIkJaW5P8T8uAACA\nthX3UbG2CzvuG/Z8u1ffu798sIiIuLesWPTZtp9OJuvjrm0++KEhNa2GPMczy++6/swJAABQ\nWhXrFjuPO33RhLnJrsub645+/PTslTta3j588iMDQ45smvjoEnee45nld11/5gQAACi9irXY\n/fzmxJ/DO1z+2ZMxa+X+Wv2m3dmlVf3r2z784ujUvze8eyo11/HM8ruuP3MCAACUZsVX7JIO\nr5rxhe2ZyXf4RuxJ207YXF27VvL+aI5o0zjEtHvLmdzGM8+W33X9mRMAAKBUK6adzNwZfz/3\nzLs3PbGktlXvG8xI3SMi9axG30hdq+GLPUkZHXIelwFS4HWvOufvv/9+5sylnmc0Gps0aVL4\nZ+2j0+m8/zWbzQGctgAURRERg8FAkswxRMRkMnl/TWrR6/W+JG63mrsJGAyXPhbMZrPHo+Zx\nTt4kiqKo/nb1/nZKQhKvkvBh4qXX61VPUtI+THx/QQHhcrkCOBv+C4qp2K1/8ZnEJqOGXR/j\ncSX4Bt32VBGJNlz+1zTGqHem2HIbzzxhfte96pwrVqz44osvvLcjIyM3btxYuGecA6PRaDQa\nr75c0TOZTCaTSe0UIiJBQUFBQUFqpxARsVgsake4JDg4WO0Il4SEhKgdQUREUZTQ0FC1U4iI\n6PX6gCQ5W+gZDAZDCUlScj5MzGaz6hXTK7AfJna7PYCz4b+gODZRnP1+4fL95Wc80iHrY5ss\nIpLgvLxx4oLDpbeYchsvzLr+zAkAAFCqFccWu3Pf7MlI/nvoHb19I2tH9NsYfN07i9qIbDuY\n7qxivvQl1KF0Z3ibCGNwgxzHM8+Z2zL5HfdNOHHixPHjx3tvezyeCxcuBPAVCAsLMxqNdrs9\nJSUlgNMWQEREhF6vT09PT0tLUzdJVFSUoiipqak2m+3qSxcZnU4XGRkpIhcvXnQ4HComMRgM\n4eHhIpKYmKjuly8mk8m7NSg+Pl7dr2ItFovVanW73QkJCVdfuigFBwcHBQU5nc6kpCR1k3hl\nZGQkJyernUJExGazpaaqfBRaCfkwURQlKipKRJKTkzMyMgI4cwnZEonSojiKXa2BT8267dI/\nmR73xcfHTmk98bk7y0YHRcRUNC3e8O3ZLj2qiIgj9ZcfkjNu71I+KKJqjuOZ5wyK6Jivda86\np8Vi8W0/d7vd8fHxRfFSqPvPpI/H4yGJLwBJcqN6ksyviYoxSlQSnxKSRPU3iTeDd/821ZP4\nlJwk+A8qjmIXVK5abLlLt7372EVUq1mzfLCIjO0TN+7NKV9VGF8/0vHpwlesFToPrBySx/jR\nj97ZmhoyZFBvUUz5XTe3cQAAAG1Q+dILsX2nj7TPWTF70gWbUuu69tOnDdflOX5q8/rPzpcd\nMqh3AdbNbRwAAEAblFK3xfiN0TOHLniySB8i4F/FhoeHe/exU323mMjISL1en5aWpvo+dtHR\n0YqipKSkqL6PnXe3mKSkJNX3sYuIiBCRhIQEdfexM5vN3n3sLly4oPo+dsHBwUW3a4T/goOD\nLRaL0+lMTEws/GxJ3ZoVcoYqOw5evHixJCSp+O2+krCPnU6nS01NTU9PVzGGoijR0dEikpyc\nHNhDWWNiYgI4GzSvlG20OvPd2kN1b1Q7BQAAQEmk8lex+RVatfH0GyqqnQIAAKAkKmXFLrgK\nrQ4AACBnpeyrWAAAAOSGYgcAAKARFDsAAACNoNgBAABoBMUOAABAIyh2AAAAGkGxAwAA0AiK\nHQAAgEZQ7AAAADSCYgcAAKARFDsAAACNKGXXigUAIAtlwLrCrH5ubvNAJQFUR7EDABREbNxC\nGfZ1YWagUQEBx1exAAAAGkGxAwAA0AiKHQAAgEZQ7AAAADSCYgcAAKARFDsAAACNoNgBAABo\nBMUOAABAIyh2AAAAGkGxAwAA0AiKHQAAgEZQ7AAAADSCYgcAAKARFDsAAACNoNgBAABoBMUO\nAABAIwxqBwAA5ENs3EIZ8lVhZjg3t3mgwgAoadhiBwAAoBEUOwAAAI2g2AEAAGgExQ4AAEAj\nKHYAAAAaQbEDAADQCIodAACARlDsAAAANIITFAMAEBjKgHWFWZ1zR6Pw2GIHAACgERQ7AAAA\njaDYAQAAaAT72AH4T0jq1qzg64qISLWdhwIVBgCKCFvsAAAANIJiBwAAoBEUOwAAAI2g2AEA\nAGgExQ4AAEAjKHYAAAAaQbEDAADQCM5jBwBQWWHPMhi3MHBZgNKNLXYAAAAaQbEDAADQCIod\nAACARlDsAAAANIJiBwAAoBEUOwAAAI2g2AEAAGgExQ4AAEAjKHYAAAAawZUnAODqYuMWyqAv\nCzPDubnNAxUGAHLDFjsAAACNoNgBAABoBF/F5sxisQRwNp1OJyJ6vT6w0xaAoigiYjQaS04S\n7w11Y4iI2Ww2GNT8c/C+SUQkKCjI7XarmMT3OgQFBakYQ0SMRqOIKIoSkLdrUuGnKBzfsyCJ\nTwlJovrnoU/2JC6XS5UkKL0odjkzmUwBnM37b7ZOpwvstAXg7TF6vV71JF4Gg8FXaNRlMBj0\ner2KAXwV02g0ejweFZP4fiOqv0m8SRRFUT1JQJScZ0GSLEpIDMkpicPhUCUJSi+KXc6SkgL5\nP5Dh4eFGo9HhcCQnJwdw2gKIjIzU6/U2my0tLU3dJNHR0YqipKen22w2FWPodLqoqCgRSU1N\nVfcD1GAwREREiEhycrK6/49uNptDQ0NF5OLFi+pWTIvFEhwc7Ha7A/v3qJaS8yxIkkVAYiiK\nEh0dXRRJrFZrIafFf0qJ2FgCAACAwqPYAQAAaATFDgAAQCModgAAABpBsQMAANAIih0AAIBG\nUOwAAAA0gmIHAACgERQ7AAAAjaDYAQAAaATFDgAAQCModgAAABpBsQMAANAIih0AAIBGUOwA\nAAA0gmIHAACgERQ7AAAAjaDYAQAAaATFDgAAQCModgAAABpBsQMAANAIih0AAIBGUOwAAAA0\ngmIHAACgERQ7AAAAjaDYAQAAaATFDgAAQCModgAAABpBsQMAANAIih0AAIBGUOwAAAA0gmIH\nAACgERQ7AAAAjaDYAQAAaATFDgAAQCModgAAABpBsQMAANAIih0AAIBGUOwAAAA0gmIHAACg\nERQ7AAAAjaDYAQAAaATFDgAAQCModgAAABpBsQMAANAIih0AAIBGUOwAAAA0gmIHAACgERQ7\nAAAAjaDYAQAAaATFDgAAQCModgAAABpBsQMAANAIih0AAIBGUOwAAAA0gmIHAACgERQ7AAAA\njaDYAQAAaATFDgAAQCModgAAABpBsQMAANAIih0AAIBGUOwAAAA0gmIHAACgERQ7AAAAjaDY\nAQAAaISheB4m4+Ifr89btv23IzZ9cNUa9e4YMap1tRAREXFvWbHos20/nUzWx13bfPBDQ2pa\nDXmOZ5bfdf2ZEwAAoLQqni12nkWPTdp+vvyop5+bOfHhOP2Bl8c+cd7hFpGjHz89e+WOlrcP\nn/zIwJAjmyY+usQtksd4Zvld1585AQAASq/iKHb2pK83n027b+rIVg3q1K7fZOiEcS77yZXn\n0sSTMWvl/lr9pt3ZpVX969s+/OLo1L83vHsqNdfxzPK7rj9zAgAAlGbFUex0hpihQ4e2CDVd\n+lkxiIhVr7MnbTthc3XtWsk7bI5o0zjEtHvLmdzGM8+Z33X9mRMAAKBUK46dzIzBDXv3bigi\nCb/s/Onvv3/a9HGZ+rfeW9aafnqPiNSzGn1L1rUavtiTlNEh53EZcHnOjNT8rXvVORctWrRj\nxw7v7ZCQkPnz5wfq6YuIXq8XEZPJFBEREcBpC0Cn04lIUFCQyWS66sJFSlEUEbFarUFBQeom\n8QoJCfF4PCoG8L4gIhIWFlZCkoSHh6sYQ/59u+p0uoD84SQVforC8T0LkviUkCSqfzL7ZE/i\ncDhUSYLSq1iPHvjn281fHD7155/prW6vLiJue6qIRBsubzWMMeqdKbbcxjNPld91rzrn6dOn\n9+/f770dGRlpMAT+lVEUpSimLQCdTuf9J1N1JSeJt3yXBCUnSQl5u0pJSlIYJedZkCSLEhJD\nckricrlUSYLSq1jfzXGjn3xJJO30D/ePnjG1Qr3xcRYRSXC6Q/79l+yCw6WPMOlMOY9nniq3\nZfI77puwWbNmVqvVe9tisdhsV/TIQjKZTDqdzuVyqf7/XmazWVEUp9PpdDrVTeLdUOdwONT9\n2FIUxWw2i0hGRobbrebhNDqdzrsZ1W63q7vFTq/XG41GEQnsX0EBGAwGg8Hg8Xjsdru6SQJC\n9dfThyRZBCpG4b9/yJ7E6XR6P6MAPxVHsbt4+Jtvjphv6dbc+6O1YvNbo4LWbjhjvL6ByLaD\n6c4q5ktl61C6M7xNhDE45/HMc+a2TH7HfRP26tWrV69e3ttutzs+Pj6Ar0B4eLhOp3M6nSkp\nKQGctgCMRqNer8/IyEhLS1M3ibdi2u12dT/ZdTqd90MzPT1d3dptMBi8xTArx60AACAASURB\nVC4tLU3dsms2m73FLjU1Vd2KabFYvMVO9T+cgCg5z4IkWQQkhqIohS92OSYJCQkp5LT4TymO\nb8Ec6VtfWzzbe34TERGPa2+a01rVGhTRsaJJv+Hbs5cWS/3lh+SMJl3K5zaeec78ruvPnAAA\nAKVacRS7yLj7a5nsE2Yu2/37wcP7f105b9wv6eZ77qkpimlsn7jDb075avfBv4/+/sakV6wV\nOg+sHJLruMjRj95Z/tZqEcn3urnPCQAAoA3F8VWszlhm+qynFi1575VpG5zG0KrV4x55flLr\nSLOIxPadPtI+Z8XsSRdsSq3r2k+fNtzbNHMbP7V5/Wfnyw4Z1LsA6+Y2DgAAoA3FdPCEtVLT\nsdOa5nCHou866PGug/wdb7vo3UOjZxZs3VzHAQAANKGUbbQ6893aQ3VvVDsFAABASVRSTt7j\np9CqjaffUFHtFAAAACVRKSt2wVVodQAAADkrZV/FAgAAIDcUOwAAAI2g2AEAAGgExQ4AAEAj\nKHYAAAAaQbEDAADQCIodAACARlDsAAAANIJiBwAAoBEUOwAAAI2g2AEAAGgExQ4AAEAjKHYA\nAAAaQbEDAADQCIodAACARlDsAAAANIJiBwAAoBEUOwAAAI2g2AEAAGhEvoqd+++jh7y3bGd/\nnDxu1JiJz288mlwUsQAAAJBfBj+Xy0ja0b9tj0+PlM9I3etxJvSq1/7LC+ki8uqsJW8e/G1A\n1ZCiDAkAAICr83eL3Yred36yL2PQYw+JyNndj3x5IX3Uuj8Sjn3TxHh6bN8PijIhAAAA/OJv\nsZvxw9lqPVcuffYBEdkzfZs5vO3c7rUjqreZe0/shd9mFWVCAAAA+MXfYnfC7oxpVcV7+60f\nzkU3fEwvIiLBNYOd6UeKJhsAAADywd9i1zrMfGrtLyJiT9z4/rm0Jk828Y7vWvOX0RpXVOkA\nAADgN38Pnpg6+Jo2c4bcOmy3YefbiiFqRrsKTtvhpa+88vB3Z8p1eqVIIwIAAMAf/ha7li9u\nnnLqphnL5zkUy5BZ3zYINqacWjPy6cUhldu+8+HtRRoRAAAA/vC32OkM0ZNW/vhU2vlUfVS4\nWSciQZHdV69v1aFrq3C9UpQJAQAA4Bd/i53XkR2b3t+w48TZ+HYvLL7beDqickNaHQAAQAnh\nf7HzLBrSZtSb270/WJ+Zd0vKvI6NP283bP5XS0YZaHcAAABq8/eo2CPv3j7qze2dR8359dAp\n70hk7RdnjGi1denonosPFFk8AAAA+MvfYjf98Y1RdSd8teDhhrEVvSMGa9yExd9NbRC9dcqz\nRRYPAAAA/vK32H10Pr3W4P7Zx28bWNN24bOARgIAAEBB+Fvsqpr1yYcuZh9P2JukN1cMaCQA\nAAAUhL8HTzzVouzgdwZ+P3Nvy5gg32Da6c1DVh6NafJa0WQD8F+nDFhXyBnOzW0ekCQAUCr4\nu8Xu9pWvVVVOtK/R6P6x00Rk74o3nh03uF7tbifcFeZ/eFdRJgQAAIBf/C12ljI3//zrp3c0\n070+a4qIbHn68cmvvBPa8s5Pft5zR4XgIgwIAAAA/+TjBMVhtbu/t7n7snPH9h457dRbKteu\nXznCXHTJAAAAkC95Fbs1a9bkce8/p0/u/vd2r169AhcJAAAABZFXsevdu7efs3g8nkCEAQAA\nQMHlVey2bNniu+12nH1mwOAf0ysOfWhEp5bXRuhth/buWPzi/L+r9NmyblaRxwQAAMDV5FXs\n2rdv77v99QPX/phWe9ufO1tEXdqvruvNt40YNaRDhcZ9Jt67f9mNRRsTAAAAV+PvUbHj3ztU\n655Xfa3Oy2CtO3vYNUdWji2CYAAAAMgff4vd4XSnzpTTwjpx2f8KZCIAAAAUiL/F7q4y1sP/\ne+K43ZV50GU/8dSyQ9aydxdBMAAAAOSPv8Vu4uL+9sSt113bfc7bn3z/8/79v+xc8+68mxs0\n/CrB1u/VCUUaEQAAAP7w9wTFVXsu2TzHcNf4JY8O3Ogb1JvKjJyzaWHPqkWTDQAAAPmQjytP\ndHx44emh4zZ8vvH3I6cduqBKsQ263Hxj1ZB8zAAAAICik79aZgyt3qPf8B5FlAUAAACFkFex\na9y4saIz/7T7e+/tPJb8+eefA5wLAAAA+ZRXsQsJCVF0l05cFxERUSx5AAAAUEB5FbtvvvnG\nd/vrr78u+jAAAAAoOH9PdwIAAIAS7urFzh7/54/ff/fr/iPunO5NPnNgxoBuAY8FAACA/Mqz\n2LnTZw3rGlqmRvNWbRrViy0T1/mLEynujL+nDL01rkalyPAwq9kQVqHuxPe+LK60AAAAyFVe\n+9j99kr3x5dtNQbX6nlLm3LB9m0fr+rT4t7ZLX+Zuvp42WsaNWoap3g8wRExteq3LLa4AAAA\nyE1exW7Gyz8arXE/nPylUaRZRBxz911XvtGI1Y4uL27ZOK59cSUEAACAX/L6KnZ9vK1ss9ne\nVicixtB6s1uUE5FXH2pdHNEAAACQH3ltsUtyuivWCc88EtEgXL7+KzaIy4gB8FdSt2YFXFFE\n4hYGNAtwFQV+u4pIovCOhfqudlTslfcrOqXoogAAAKAwOI8dAACARlDsAAAANOIqe8ud3/XG\n1KmXT1N36vuzIjJ16tQsi02ePDngyQAAAJAvVyl253a9PmVX1sEpU6ZkGdFesYuOjg7gbIqi\niIjZbDaZTAGctsBJrFarxWIpCUmCg4ODg4PVTeIVFhamdoRLIiIi1I5wSVRUVEDmSQrILAXl\n+1tWN4aQJCclJEnmD/ySk8QrIyNDlSQovfIqdlu2bCmuGCXOxYsXAzhbcHCwwWDIyMhIT08P\n4LQFEBoaqtPp7Ha7zWZTN0l4eLiI2Gw2dT+2FEXxVrq0tDSn06liEr1eHxISIiIpKSlud44X\n8CsmRqPRarWKSHJyssfjUTFJQAT2b7kwSJJdCUlSQmJITkk8Ho/ZbFYlDEqpvIpd+/b/3bMQ\nOxyOAM7m/dfR4/EEdtoCJ3G5XCUhiaIoqifR6S7tZup0OtVN4qtQTqfT5XKpmMT3mjgcDg0U\nO9Xf6j4kya6EJCkhMaQkJUHpxcETAAAAGkGxAwAA0AiKHQAAgEZQ7AAAADSCYgcAwH/IV92r\nKXladUHlEzhktvLpflXKhMTEDs1tAbfzwvsvj7uxZb0yESEGc3CFWg3vGjVl9zmVz/ygoryO\niu103bU1Fmxc1raCiNStW7ffhh8mVQ0trmAAACDwqvW5f+y1Cd7bbsfZWXP/Zy1728iBtXwL\n1LYYVYqWVeqZpXc/t6J677Ev97kpxwUcyT/d1bTT6j+SKl/XsVe/LkbbuYP7dn24aOrqN997\nf99Pd1QLKWSAszufvm/6r0+++/ENYSqfhtZ/eRW704f/ODRj6beTuhl1cuDAgT0/7tz5d87F\nrkWLFkUTDwAABFLt+5566d/bjtSfZ839X0jFoS+91EPNTLlIP7dWRIbPmzS4Sk71w+MY177b\nmiMZT7zz/fMDLveQw+ufu7bHM0M7PnLH0dcLGSDtzI7PP988xKHmKajyK69i9+roNp1enNz2\ni0tXlfi4T9ePc1lSAye7AgAA+eJxZbh1Jr1SZPO73SJi1uX8AKe3PDj35/Mtp+7I3OpEJLb7\nxBU3Lb1t3bI5p+Y8UqmwG+0KwpNhdxnNhoC9Lm5noscQofdv4bz2sev4wuajP279cOXKFStW\niMiNc99YkYtAxAYAACXC/kWtFUWZfyol05i7c6QlpMJQEbHqdTcs/nXBwz1igq1GvalMlfoD\nxy8877h8yZyUP7c9cne3qmUizMFRcY07TV2yLo/L6fyz84MB3VuViQgxBYdf06zLtDe3eMdX\n1y9TttFnIjK2cmhwmTuzr/jRqE90hrB3xjfLflfX1xa//vrrdf591PFVwsKqjM+8wC9Tr1cU\n5bjdJSJux/mFE4Y2rFU+yGgMi67Sue+Y78/bRGRGjYgavTeLyB0xVt/quaUVkRV1Y8KrTfrx\ntccqh4dYTPqIsjXveep/bpFdbz7RuHo5izmkRr0WU97flzlGHi/U8jrRkbVm2xN/uKdDvRBz\nVIrL3y1oV7lWbI2m7Wo0FRH56KOPut11V9/yJeKyngAAoOjU7P+sbnSXJS/ufWjupY1hF4+/\nsDnR1ubVS/1m/4LuY/ad63rnoOa1I/Zs++jtl0Zv3HHir29e0Iuknl7dqO5dJ5RKA4YMj43R\n/7rlwykP3LJ6+/Kf3xqc/YHO7Xr5mjZPpJtj+w8aVTM0/Zs1b08e0vGbI1s2Ptv+htc+WLnn\nqb4jvx/+zid3VayebVXPzCNJweUfrhWUw5as4Eo33Xefv092zs2Nxm4607HviDuHVbl4Ytfi\npQu7fHMi4dTqfm+tqrzp8UHTfnn6g087lK2Td1rvVGln320zOmHAI8+0qGL+dNHMd2cOOnh0\n2d5NaY899vRA17G5z82fdm/TLrcktgkziR8vlNsZP6jRTRfa3jtj3hhLLpsts7tKsfP58MMP\nRSTt1C8frdm47+jpNJehQs36N/buc30VNTZyAgCAImOO6DSmUsiSd6bJ3LXeke8nLFN05jn3\nXDrGInHv32M+3D+3T5yIiOeF5SMbD1384rCtDy9vX/HlG4edUGK3nvipVXSQiIg8v/rxxrfN\nGvLc5Nsm1gy/8nE8o2+ZnG6qs+nwrrblrSLinj5pfPO6s2bc9M24pLatO3YMKSMidTp06ZLt\nG1WX7fiZDFdMeKtCPlNn+h/jNp2uctNHm96/3Ttye2jrnsu/W3U+vW+7TkpClIg07tSlc7Tl\nKmnDTCLitB0du+nUS50qisigAfUt0T1+Xn1465mjrSPMItKz1q+x/TfP/yu5Tb1oEbnqC5V8\n8rnEebs2jm6Sr2eUj9OdfDzp7qiqTQaNGv/CK3Pmz3n5qTFDmlWP6Tspt/3uAABAaTViYsP0\n+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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Figure 2: Breakdown of Ridership by Month\n",
    "bike_data %>% \n",
    "  group_by(customer_type, month) %>% \n",
    "  summarise(total_number_of_rides = n()) %>% \n",
    "  ggplot(aes(x = month, y = total_number_of_rides, fill = customer_type)) + geom_col(position = \"dodge\") + \n",
    "  scale_y_continuous(labels = scales::comma) + scale_fill_manual(values = c(\"#DC3220\", \"#005AB5\")) +\n",
    "  theme(axis.text.x = element_text(angle = 45)) +\n",
    "  labs(x = 'Month', y = 'Total Number of Rides', title = 'Total Rides per Month',\n",
    "       fill = \"Type of Customer\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "9f857b14",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:53:39.840291Z",
     "iopub.status.busy": "2022-01-07T18:53:39.838707Z",
     "iopub.status.idle": "2022-01-07T18:53:40.420497Z",
     "shell.execute_reply": "2022-01-07T18:53:40.419852Z"
    },
    "papermill": {
     "duration": 0.741789,
     "end_time": "2022-01-07T18:53:40.420630",
     "exception": false,
     "start_time": "2022-01-07T18:53:39.678841",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'customer_type'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdd2AT5R/H8e9lNG2a0paWvVv2BtlbhoIgoGyQPVTgp4gsBWXIUFRkCIKi4kAZ\nMkRZIshQQJmi7A2yoVBKd8bvj5RS2tJeV1Ku79dfyZPL3fe53iWfXu6eUxwOhwAAAODxp3N3\nAQAAAMgcBDsAAACNINgBAABoBMEOAABAIwh2AAAAGkGwAwAA0AiCHQAAgEYQ7AAAADTiMQ52\nDnt4abOHoig6vcfee7HuLsdtwq/MVRTF07eBuwtR5eRXjRRFafTVyaxbRMTV3/o2eyLQ4pGv\nwpuPmqaCt4eShE5n8PHLU63hM5MX/mJPMPG+N6oqitJq2+WUl/tRsL+iKOtuR2VSP1Kipo8Z\nZNbrkq6ihJ7aeDFzl5iRbSNpeQaTpVCJMs/3H/nToVuZW2emSMdfMEv3nfM/t1QUxWguZU/y\n0o5epRVFMZpLxiQZzH7Xy+UVRclVZESm1/NlmQBFUb67EZHpcwY0z+DuAtLv1j9jTkbGiojD\nHjtq5bktvUq5uyIk5rCH79x10GAqWrtGEZctdHzD5xedupO/etOnaqWySeQrEeyjV+Kf2q0x\nty5fOvj7+oO/r/9+y7zD372cxZWmn/o+ZlDhoJKej/jvr6A52316FAkuabr/94y8G3L1/MlV\nX3ywetGcbu+uWzyyqVtLSyzVv6CL95189YaKbLRGnlpxM7JToFfCl+ZtuCQi1sjTH1++N7yQ\nJeFL69ddEpGiz3VyQYUA1HI8tpY3LywiBZ8JEhHf4m+4uxy3uXf5YxEx5arv7kKSEXNvv4jk\nKvpWfMuJRQ1FpOGiE1m1SHu0UVGM5nLhNnsKU5U3G0Vk8fXwxO+2hi57p71z15hy6o6z8ea+\nNYsWLdp0NSLlJc8I8hORtSGRGSlfFXV9zCAvnSIiO+9GZ90iEsnItuH8k+2/F5Ow8d7lI/NG\ndTYqioj0/+Fs5lSZKVT8BV2/79TJZRKRVhsuPFRG2F+KEheWa0z7O+FLdltEoFEvIi8fvpXp\nxXxROneyeyiAVD2uP8XarSHDdlxRFN2nn/7gpVPunp/++90YdxcF93PYI2MdDqO5glmnpD51\nEoo+V6dxq4YUtIjIknknnI0B1Z/t3bt383xeKb7VdTLYx5zDu0C5l99bumvucyLyda/W12KT\n/szoHtnzLziiSoCIHPn4WMLG63umORyOYh06i8jJBasSvhRx7cubsTZF5zE62NeVdQJI2eMa\n7K7vGX4p2uZTZFjrQtUmlPZ3OGxvLDnjomU7oq9nm2+ILGYPj7K6uwY36NQwn4jcOXTH3YVk\nsZyxJT/x8rKe+bxjI468/Mt/7q4lW6sxoqKI3Pzrq4SN+6ftFZGOU+cEexnCLn5wJebBBnNt\nx3IR8c4/oJhJ79pKAaTkcQ12G0f8IiLVJ74oIp0m1xSRvycvSDjBuvYlFEWpMe3vRG+8tLmz\noii5y0yMbzn/+3d92jcplNffZPYrVanm4InzT0U8lGaOLaivKMrQ03funV/XtWF5i4f5m+tx\np/Q6bKHffTiiWa3yAb7eBg+vPEVKt+rxysZjoUnqta2f+0ajiiV8TJ55i5TrM3phpF0qeHv4\nFBiYaLpUi8mgVOfvPEG7/8nbe78ZW7Gwn8XLaDB5l6jccNyCTWnt1JJygR6W6iJy98I7iqIE\nlPky4ZvDTm8a8FyjfAG5jJ7exSvVf3PeRhXl27d9O61to8p5/Cwe3r4lKtYbPP6zy9G2+Jd/\nbVVMZ/ATkYibPyiK4lPof2leQc7FRNtFxBIcdzrRwYlPJLp4wh57/bO3XqxZuojFZAosGPT8\nwLH/3En+gLGaP2jIv2tf6dayZIEAk9HDN6BwwzZ9l/x59VG1PbqPqawcSXFLziC1O4LDumnh\nhJZ1yuX28fT2y1v1yedn/LA36dzStW2kQD/6jYoismvyX+oLPrfqGUVRirddm2heR+fVVxSl\nbL+tj15cJmylGd930vFJkq/+yyIScWPZ+QTVvvvndZ3B742gwPEVA+y2e5NO3I5/6d95J0Wk\nUKvu6VhuOso7sXy0p15n8qm85mxYylMCOZ27fwtOD1v0fwFGvaIz7Q+LcTgcMfcOmXSKouh+\nvR0VP03IsTEi4p2/f6L3zquWR0Q6rIs7j2TXR730iqIoSr7i5evXrhLobRAR70JNN197cELV\n0fn1RGTA/o1Vc3l45Svd/Jlnf7wV6XA47Na7A2vlFRGdwa9KjbqN69Us7m8SEb1HgTU3Hjof\na26viiKi6DxLV6tbtkhuESnUZHARk8GSf0DCydQUk5T6c+zUzN95Hk+zD/ooiuJdoGSzZ9s1\nqF7cuam0mfVPmjp1cMakUa/3ddY2ZsyYSR/ujZ9/xdFvFTLpLQVLNX+2XcPqRe/P/9+U65/V\n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\nAEAS/wdUvUA4TWxYmQAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Figure 3: Average Ride Length for Each Day of the Week\n",
    "bike_data %>% \n",
    "  group_by(customer_type, day_of_week) %>% \n",
    "  summarise(average_ride_length = mean(ride_length)) %>% \n",
    "  ggplot(aes(x = day_of_week, y = average_ride_length, fill = customer_type)) + geom_col(position = \"dodge\") + \n",
    "  scale_y_continuous(labels = scales::comma) + scale_fill_manual(values = c(\"#DC3220\", \"#005AB5\")) +\n",
    "  labs(x = 'Day of Week', y = 'Average Length of Rides', title = 'Average Length of Rides for Each Day of the Week',\n",
    "       fill = \"Type of Customer\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "50211131",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:53:40.742309Z",
     "iopub.status.busy": "2022-01-07T18:53:40.740711Z",
     "iopub.status.idle": "2022-01-07T18:53:41.300375Z",
     "shell.execute_reply": "2022-01-07T18:53:41.299733Z"
    },
    "papermill": {
     "duration": 0.721491,
     "end_time": "2022-01-07T18:53:41.300534",
     "exception": false,
     "start_time": "2022-01-07T18:53:40.579043",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'customer_type'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "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\n/3BLl+79KY7NuJUSPtzUarUQ4vrskTsia62Y1b9qteqNGnwXd3v/itXro7JWLJ3XSQihiby+\nbuNJn5atX59YaqR+oH+4lS5dOmUPN2OObY1Go3+4FSpUSCaRYmNjCxYs6OHhkTt37viF5n24\n4etl7oP85CIu4taANk27DJ8WsGXj3Il9PT09h478ycvLe8HBBwlv9vTg0Obtp5klz4IzL+5s\nHm/GSJrIwKVTxv/YqVPfQSO3nA6MCT3TorHXyLVXE95Gpwkd26ZpzznXJEnS6aK3b71oykiS\nJCW/iUwQ6eNU5r3XEpHDvSZ9YnhLknRo/lAvr8ZTAs7F3/LfUyNbdFps7DwyHNvxNnZt1WvB\nzYQ5ds0b6OXls/rcS0mSdJqQ9k0aD1o4JW0/CvApMhzbcouUMM/6/QHyGUj4enztM3bx/v5j\nyEFVg6X/61qkkHvZKvUz3Np74FHZvjUtlq9Y+cym4LeF335CPiro8M7zWZs3Lp382oyRJ2Bf\nZLfB/bKHXTJLJE3k7aFdB922catbp4J92E3/1aujinXo4vbM9FMsyUQKL1Cndo16yWwiY0dK\nMpV1o/GN0t0210CSycRYIkkO7+aNy+T1qF3E8dWqpUv2//MsnYNV8P3Ts/7cV6bXz+VzORgv\njAzHdkLymfWR29iWYaREedavP1SohOuVvRvkMJDw9aDYvbV0/gobn27fF3h7sq7Muf7ZsCtw\nyO//M/1uJpk8LZvXNcueT8ivaH4qkrnKQfKpBo4bZJZIqei+Rs0T71PDWwiRtVD57z3yv3lw\nftP2feevvazTfXiH73IZNYzcxnaiLm6uYzA+JquxLc9IcpsgwNeJ0528VdDBavveM6L+211I\n5KMIK/vCQoiSnr0WFSq3btOmxXNmWttmath3ks+3WcyYx1yR9l1/k71dlfhzolZs5zp/+FUh\nRLVuvzlnmz1u0dgbZ6u18aqaPu7xillXq/brY+w8yUQS5rvXkklllkinp/7xPLPPyl/bqIQQ\nnt75xv6wZM7mrks6m/Fe00tmeAshXAqW7za4fDdThZHV2NZE3h7adVhI3sr1m3gFXTm4cHyv\n56OWTPyh3M+LRyzMPL1r9beHS6rU6bp2LfDTkt2iR2GVyqZBo5JGTaUnq7Etz0hJ5qnWbap5\nH2742lDs3krm1FAuBcs3b16w22BTnBrKkDxCCGFVsNvgiSbb8wn5Fc3kIwmTlwNDUpk+kjy7\n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\nHgm2L9Jn+PiODco526qFEDbOmf3W7Sji1czV1uSvflUWRR2ur9u0MTzntx55PnjqDjq1aNLu\nWz+O75bHrK/JgeSpJMn83xSeJrSxz6b2H3AqNM+42WOLpLdOdG1I0L9OWUz/GkvaO3fgrF33\nGvSd1r1W3vil9zYPG7Dy1Qr/+emMtPtNESm2mXfzEv9bNqqgqb//Md6hRUOnbrmWsXivpb/W\nNVeGeNroR5P6DjoXlW/c7LFF0lveOLHT39//4jObQnZvHtrWWzO/sznDSdpx7VqeC9d0GLfY\np6SJ3plKJH77jJ01Slze6++/9spLh7pNW/g0KDKiQ8/Kfyz3zS+nc3rJYHjrRT4/1K/Pny/V\nmUsWznLt4tWy7X8d5GO21zCvLs/oNHLf962r7F97Qf8KQb9c0kWrLEzafXWxL06f+MfCxbVc\nybwJnw0f7hzTf2nIX/5Tbc0z6avb8Fuf5X8/LtmgS9emNXNlctBGhxzduHi2/+GyHScN8S5k\njkiAoZQwY6f3bt5u7aqNF4rVrpr5w5fCtg5m+UrmJObtXl3a0H/avko9JlV3czJHJCHkNHmg\nl7dM7WwRlw4e26V/T9ZcMfTezdut/WvzxWK1qxV2K1y9vrdHbqvb925lquRlssmMpKksCmW5\ntfX44xKtWhdJZ57p3vfbZ8vlmj90bdGkacns6lM7Vy9cdTSXfezZU7HNPMuYJVg8uQ1vPSvH\nvHXrekgxUbFWmRp1GtCuel4zhrHPUvb29o3Hzj/0HTsv4SsElcrUE1EqtUPOvPlyZHVWCUmI\ntx3u0Un/wTP21hgw6dvcZnneFkKoCldpUCh9+Pa1fhs3rd+2a/uqVf5nH4gOQ377oWY+M0UC\nDKWcGTu95OftzOT9vF2zTOf7jFnu3uKXUa3LmjGQrCYP4h1aNHTa1ht1ekzuXc/N3FkSzdvJ\nZCAJIYSkixzUut0L1+7LfzPn7OZH20e6fWqXv7+/rlxv845tIdfhLTfPj07o9r/TvvP9mmWz\nN3cWIYRuzfjuV12qVnPP8Oja35v3/1O5/dhBzUqaO5XQRL66ef3G3Seh2fPldyvk5mzM7wQC\n0orSip2Qd7ezs9AVMXer04sNub1u/b7nUdalq3nWLG7cUxAbjm5niEfbhvVeeGu6/9p8tuac\nhZLt9hFyHd6yIpNXCPEeHvef57/nflBElnzFGrX44fvSZj5AE/hyKbDYiXfdTlNn4jDvvObO\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Figure 4: Average Ride Length by Month\n",
    "bike_data %>% \n",
    "  group_by(customer_type, month) %>% \n",
    "  summarise(average_ride_length = mean(ride_length)) %>% \n",
    "  ggplot(aes(x = month, y = average_ride_length, fill = customer_type)) + geom_col(position = \"dodge\") + \n",
    "  scale_y_continuous(labels = scales::comma) + scale_fill_manual(values = c(\"#DC3220\", \"#005AB5\")) +\n",
    "  theme(axis.text.x = element_text(angle = 45)) +\n",
    "  labs(x = 'Month', y = 'Average Length of Rides', title = 'Average Length of Rides per Month',\n",
    "       fill = \"Type of Customer\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "id": "2c96db81",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:53:41.630692Z",
     "iopub.status.busy": "2022-01-07T18:53:41.629205Z",
     "iopub.status.idle": "2022-01-07T18:53:46.299257Z",
     "shell.execute_reply": "2022-01-07T18:53:46.297555Z"
    },
    "papermill": {
     "duration": 4.837309,
     "end_time": "2022-01-07T18:53:46.299431",
     "exception": false,
     "start_time": "2022-01-07T18:53:41.462122",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\n"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Figure 5: Ridership Breakdown by Bike Type\n",
    "bike_data %>% \n",
    "  group_by(customer_type) %>%\n",
    "  ggplot(aes(x = bike_type, fill = customer_type)) + geom_bar(position = \"dodge\") +\n",
    "  scale_y_continuous(labels = scales::comma) + scale_fill_manual(values = c(\"#DC3220\", \"#005AB5\")) +\n",
    "  labs(x = 'Type of Bike', y = 'Total Number of Rentals', title = 'Breakdown of Ridership by Bike Type',\n",
    "       fill = \"Type of Customer\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 27,
   "id": "e5df7772",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:53:46.640045Z",
     "iopub.status.busy": "2022-01-07T18:53:46.638361Z",
     "iopub.status.idle": "2022-01-07T18:53:48.027593Z",
     "shell.execute_reply": "2022-01-07T18:53:48.025809Z"
    },
    "papermill": {
     "duration": 1.560927,
     "end_time": "2022-01-07T18:53:48.027955",
     "exception": false,
     "start_time": "2022-01-07T18:53:46.467028",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'customer_type', 'month'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nfqFWRdO04EUDIOdAsMvpnDaBYdUSBQ7b/Un9Xj9rqNShUY0qdSu27dZs0MAJRMRyIRM/3tr7\nv+MnTp769++9m9csq9pj3gdv1fDWLn+JHrn/w1wdpGKYtF+vyd/5/TlduK7d35+8q8e8jsWI\niDOoWc743XdbGfc6RpXRRT+HGJaIntpsoTwTS0SCkKadYxlBcErvU/m75vzCnZ6XKwljIyv5\n3HTeCm5uPiDzwDcEp90ReNEAyDnwHbucLrJuCWvS0XOmRzd8Msft7dq167HkJ7d3Sr6+8tg9\ny7pVcwa+1q1Zg9pFwx7dpyruv60rPt5ctFLtrq+9Oe2DFavfLffXjtUS7fKX6NGOv568vx/4\n6pqxcMs0BX1eraMJq/dB73InVow5nWonImPB9oIzZdcDu/YRzfpJYxbuu52JrfS8yde0iDlu\n9yXzo33kMJ0/nGglotDKVRzma/vjzGK74DBtvZGU56Xi0vtU/q7xtlxpGBtZyeem81aQuQNf\nhBcNgJwDwS6nCyn5bt1Q54RRC46cPHv+v6NLxnxk1b1Uy/jkX6iq4HKC0/7VgX/uxdyJPr5n\n5qjVRHTtdgIflvr1V5/O/ezH0xeunPnn1y92XDdGNSIitZd2+Uv06Pc5o7/c9/u5039vXfLe\nhispvcbX91hWoe/8mobkaVN3EpE6qM6QGpHrhk3a9dPRyxdOf7X03a//i23VOP8zbrHnQZ4a\n75XTJI8aPvfn4/9Gn/hl3oixwVqWiAwF+rctbFwybNrBo/9ciP5z3Yx3oq1hw14rIWefytk1\n3pYrDWMjK/ncdN4KJAYJQ2S6czMuLtHbQvGiAZBz4KPYnI7hdFPXL/54wacrZo5OcBpKv9hu\nycjX3Qv0eV6d//bdZWumb0/lSpar3n/6hvA5r28cOqD2rl0fDE5cvf2Tdzc+NIbmLVO93eKR\nPYnIWKifx3b5S0yP48M/HNx49caF6+9bCpcqM2jGhq5FjV5WxzBuXq8u76z49N/Gb1YOf3nu\navOyhZ8vnv7ApipSuurEpbNq+HozACJi+cgP185e/OGn8yePJF3epq9NH/HrrDVERNx7nywP\nXrTio5njEm1skfI1J308uqpBRaTyuU/l7Rpvy/UKYyPr+dx0Xgq8DpIXetRf8/GHfQc3+27z\nBI9LxIsGQM7BCILgu+q5dPPmzdTU1OzuBWSbMmXKeGyPj4+PiYnJ4s5AzuFtYNhstitXrmRx\n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\no8/T9u3bx6JZaFYAkZg5c6bdbh84cGDYyClTptjt9mHDhoWNHDdunN1uHzNmTNjIUaNG2e32\nBx98MGzkLbfcYrfbH3nkkbCR1113nd1unzVrVtjI/v372+32BQsWhI288MIL7Xb7okWLwkae\nffbZdrt92bJl6mEej8dut9vt9pUrV6pHFhQUBCPXrl2rHnno0KFg5KZNm8LmGdbGjRuDrf35\n55/qkWvWrAlGFhQUqEd+/PHHwUiv16seuWzZMrvd3r1797B5vvbaa3a7vU+fPmEjFyxYYLfb\nL7vssrCRTz31lN1uv+6668JGTps2zW63Dx06NGzkAw88YLfb77zzzrCRo0ePttvtDzzwQNjI\nYcOG2e32qVOnho28/vrr7Xb7zJkzw0bKOPfcc+12+xtvvBE28owzzrDb7e+99556mMPhCHaM\nzz//XD0yJycnGLl+/Xr1yH379gUjf/75Z/XI7du3ByN37NihHvnDDz8EIw8ePKge+fXXXwcj\ng7WRik8++SQY6XK51CPfeecdu93erVs39bBAILB48WK73X7++eeHjVy4cKHdbu/Xr1/YSCCO\n+CoWAABAIyjsAAAANILCDgAAQCP48URkduzYsW/fvtTU1DPPPFM9csuWLYcOHcrIyLDb7eqR\nv/zyy5EjR+rVq9elSxf1yB9//DEnJ6dRo0YnnXSSeuTGjRvz8/ObNm3aqVMn9cjvvvuuqKio\nRYsWYc/PXbduncPhaN26devWrdUj165d63a727dvH/Zs+i+++MLv93fq1Klp06YqYX6//4sv\nvhBCnHTSSernyHs8njVr1gghunTpov5zEKfT+fXXXwsh7HZ7RkaGep5h5eXlbdq0SQjRs2dP\n9XPPjx49+vPPPwshevfubTQaVSIPHz7866+/CiEuuOAC9R9PHDx4cOvWrTqd7vzzz1fP848/\n/ti5c6fJZDrnnHPUI3fv3r17926bzda9e3f1yOCgSElJOeuss9Qjt27devDgwfT09NNPP109\nUn5Q/PTTT8eOHWvYsOHJJ5+sHrlp06a8vLwmTZp07txZPVJ+UMhYvXq11+uVGQ6rVq0KBAKd\nO3dW/8lIaDiccsop6j8Ecbvda9euFUJ07do1KytLJbK0tHT9+vVCiDPOOEP9Rx5FRUXfffed\nEKJbt27qP93Iz8/fuHGjEKJHjx6V/j4p5NixYz/99JMQ4pxzzlH/QcaRI0d++eUXIcT555+v\n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\nAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Figure 6: Ridership breakdown by Bike Type across Months\n",
    "bike_data %>% \n",
    "  group_by(customer_type, month, bike_type) %>% \n",
    "  summarise(total_number_of_rides = n()) %>% \n",
    "  ggplot(aes(x = month, y = total_number_of_rides, fill = customer_type)) + geom_col(position = \"dodge\") + \n",
    "  scale_y_continuous(labels = scales::comma) + scale_fill_manual(values = c(\"#DC3220\", \"#005AB5\")) +\n",
    "  facet_grid(customer_type ~ bike_type) + theme(axis.text.x = element_text(angle = 90)) + \n",
    "  labs(x = 'Month', y = 'Total Number of Rides', title = 'Total Number of Bike Rentals per Month',\n",
    "       fill = \"Type of Customer\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "id": "d038fedf",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-07T18:53:48.391324Z",
     "iopub.status.busy": "2022-01-07T18:53:48.390294Z",
     "iopub.status.idle": "2022-01-07T18:53:48.771334Z",
     "shell.execute_reply": "2022-01-07T18:53:48.770335Z"
    },
    "papermill": {
     "duration": 0.561115,
     "end_time": "2022-01-07T18:53:48.771522",
     "exception": false,
     "start_time": "2022-01-07T18:53:48.210407",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'customer_type'. You can override using the `.groups` argument.\n",
      "\n",
      "ERROR while rich displaying an object: Error: Invalid input: time_trans works with objects of class POSIXct only\n",
      "\n",
      "Traceback:\n",
      "1. FUN(X[[i]], ...)\n",
      "2. tryCatch(withCallingHandlers({\n",
      " .     if (!mime %in% names(repr::mime2repr)) \n",
      " .         stop(\"No repr_* for mimetype \", mime, \" in repr::mime2repr\")\n",
      " .     rpr <- repr::mime2repr[[mime]](obj)\n",
      " .     if (is.null(rpr)) \n",
      " .         return(NULL)\n",
      " .     prepare_content(is.raw(rpr), rpr)\n",
      " . }, error = error_handler), error = outer_handler)\n",
      "3. tryCatchList(expr, classes, parentenv, handlers)\n",
      "4. tryCatchOne(expr, names, parentenv, handlers[[1L]])\n",
      "5. doTryCatch(return(expr), name, parentenv, handler)\n",
      "6. withCallingHandlers({\n",
      " .     if (!mime %in% names(repr::mime2repr)) \n",
      " .         stop(\"No repr_* for mimetype \", mime, \" in repr::mime2repr\")\n",
      " .     rpr <- repr::mime2repr[[mime]](obj)\n",
      " .     if (is.null(rpr)) \n",
      " .         return(NULL)\n",
      " .     prepare_content(is.raw(rpr), rpr)\n",
      " . }, error = error_handler)\n",
      "7. repr::mime2repr[[mime]](obj)\n",
      "8. repr_text.default(obj)\n",
      "9. paste(capture.output(print(obj)), collapse = \"\\n\")\n",
      "10. capture.output(print(obj))\n",
      "11. evalVis(expr)\n",
      "12. withVisible(eval(expr, pf))\n",
      "13. eval(expr, pf)\n",
      "14. eval(expr, pf)\n",
      "15. print(obj)\n",
      "16. print.ggplot(obj)\n",
      "17. ggplot_build(x)\n",
      "18. ggplot_build.ggplot(x)\n",
      "19. lapply(data, scales_transform_df, scales = scales)\n",
      "20. FUN(X[[i]], ...)\n",
      "21. unlist(lapply(scales$scales, function(s) s$transform_df(df = df)), \n",
      "  .     recursive = FALSE)\n",
      "22. lapply(scales$scales, function(s) s$transform_df(df = df))\n",
      "23. FUN(X[[i]], ...)\n",
      "24. s$transform_df(df = df)\n",
      "25. f(..., self = self)\n",
      "26. lapply(df[aesthetics], self$transform)\n",
      "27. FUN(X[[i]], ...)\n",
      "28. f(..., self = self)\n",
      "29. ggproto_parent(ScaleContinuous, self)$transform(x)\n",
      "30. f(..., self = self)\n",
      "31. self$trans$transform(x)\n",
      "32. stop(\"Invalid input: time_trans works with objects of class \", \n",
      "  .     \"POSIXct only\", call. = FALSE)\n"
     ]
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAP\nTElEQVR4nO3WwQ3AIBDAsNL9dz6WQEJE9gR5Zs3MBwDA+/7bAQAAnGHsAAAijB0AQISxAwCI\nMHYAABHGDgAgwtgBAEQYOwCACGMHABBh7AAAIowdAECEsQMAiDB2AAARxg4AIMLYAQBEGDsA\ngAhjBwAQYewAACKMHQBAhLEDAIgwdgAAEcYOACDC2AEARBg7AIAIYwcAEGHsAAAijB0AQISx\nAwCIMHYAABHGDgAgwtgBAEQYOwCACGMHABBh7AAAIowdAECEsQMAiDB2AAARxg4AIMLYAQBE\nGDsAgAhjBwAQYewAACKMHQBAhLEDAIgwdgAAEcYOACDC2AEARBg7AIAIYwcAEGHsAAAijB0A\nQISxAwCIMHYAABHGDgAgwtgBAEQYOwCACGMHABBh7AAAIowdAECEsQMAiDB2AAARxg4AIMLY\nAQBEGDsAgAhjBwAQYewAACKMHQBAhLEDAIgwdgAAEcYOACDC2AEARBg7AIAIYwcAEGHsAAAi\njB0AQISxAwCIMHYAABHGDgAgwtgBAEQYOwCACGMHABBh7AAAIowdAECEsQMAiDB2AAARxg4A\nIMLYAQBEGDsAgAhjBwAQYewAACKMHQBAhLEDAIgwdgAAEcYOACDC2AEARBg7AIAIYwcAEGHs\nAAAijB0AQISxAwCIMHYAABHGDgAgwtgBAEQYOwCACGMHABBh7AAAIowdAECEsQMAiDB2AAAR\nxg4AIMLYAQBEGDsAgAhjBwAQYewAACKMHQBAhLEDAIgwdgAAEcYOACDC2AEARBg7AIAIYwcA\nEGHsAAAijB0AQISxAwCIMHYAABHGDgAgwtgBAEQYOwCACGMHABBh7AAAIowdAECEsQMAiDB2\nAAARxg4AIMLYAQBEGDsAgAhjBwAQYewAACKMHQBAhLEDAIgwdgAAEcYOACDC2AEARBg7AIAI\nYwcAEGHsAAAijB0AQISxAwCIMHYAABHGDgAgwtgBAEQYOwCACGMHABBh7AAAIowdAECEsQMA\niDB2AAARxg4AIMLYAQBEGDsAgAhjBwAQYewAACKMHQBAhLEDAIgwdgAAEcYOACDC2AEARBg7\nAIAIYwcAEGHsAAAijB0AQISxAwCIMHYAABHGDgAgwtgBAEQYOwCACGMHABBh7AAAIowdAECE\nsQMAiDB2AAARxg4AIMLYAQBEGDsAgAhjBwAQYewAACKMHQBAhLEDAIgwdgAAEcYOACDC2AEA\nRBg7AIAIYwcAEGHsAAAijB0AQISxAwCIMHYAABHGDgAgwtgBAEQYOwCACGMHABBh7AAAIowd\nAECEsQMAiDB2AAARxg4AIMLYAQBEGDsAgAhjBwAQYewAACKMHQBAhLEDAIgwdgAAEcYOACDC\n2AEARBg7AIAIYwcAEGHsAAAijB0AQISxAwCIMHYAABHGDgAgwtgBAEQYOwCACGMHABBh7AAA\nIowdAECEsQMAiDB2AAARxg4AIMLYAQBEGDsAgAhjBwAQYewAACKMHQBAhLEDAIgwdgAAEcYO\nACDC2AEARBg7AIAIYwcAEGHsAAAijB0AQISxAwCIMHYAABHGDgAgwtgBAEQYOwCACGMHABBh\n7AAAIowdAECEsQMAiDB2AAARxg4AIMLYAQBEGDsAgAhjBwAQYewAACKMHQBAhLEDAIgwdgAA\nEcYOACDC2AEARBg7AIAIYwcAEGHsAAAijB0AQISxAwCIMHYAABHGDgAgwtgBAEQYOwCACGMH\nABBh7AAAIowdAECEsQMAiDB2AAARxg4AIMLYAQBEGDsAgAhjBwAQYewAACKMHQBAhLEDAIgw\ndgAAEcYOACDC2AEARBg7AIAIYwcAEGHsAAAijB0AQISxAwCIMHYAABHGDgAgwtgBAEQYOwCA\nCGMHABBh7AAAIowdAECEsQMAiDB2AAARxg4AIMLYAQBEGDsAgAhjBwAQYewAACKMHQBAhLED\nAIgwdgAAEcYOACDC2AEARBg7AIAIYwcAEGHsAAAijB0AQISxAwCIMHYAABHGDgAgwtgBAEQY\nOwCACGMHABBh7AAAIowdAECEsQMAiDB2AAARxg4AIMLYAQBEGDsAgAhjBwAQYewAACKMHQBA\nhLEDAIgwdgAAEcYOACDC2AEARBg7AIAIYwcAEGHsAAAijB0AQISxAwCIMHYAABHGDgAgwtgB\nAEQYOwCACGMHABBh7AAAIowdAECEsQMAiDB2AAARxg4AIMLYAQBEGDsAgAhjBwAQYewAACKM\nHQBAhLEDAIgwdgAAEcYOACDC2AEARBg7AIAIYwcAEGHsAAAijB0AQISxAwCIMHYAABHGDgAg\nwtgBAEQYOwCACGMHABBh7AAAIowdAECEsQMAiDB2AAARxg4AIMLYAQBEGDsAgAhjBwAQYewA\nACKMHQBAhLEDAIgwdgAAEcYOACDC2AEARBg7AIAIYwcAEGHsAAAijB0AQISxAwCIMHYAABHG\nDgAgwtgBAEQYOwCACGMHABBh7AAAIowdAECEsQMAiDB2AAARxg4AIMLYAQBEGDsAgAhjBwAQ\nYewAACKMHQBAhLEDAIgwdgAAEcYOACDC2AEARBg7AIAIYwcAEGHsAAAijB0AQISxAwCIMHYA\nABHGDgAgwtgBAEQYOwCACGMHABBh7AAAIowdAECEsQMAiDB2AAARxg4AIMLYAQBEGDsAgAhj\nBwAQYewAACKMHQBAhLEDAIgwdgAAEcYOACDC2AEARBg7AIAIYwcAEGHsAAAijB0AQISxAwCI\nMHYAABHGDgAgwtgBAEQYOwCACGMHABBh7AAAIowdAECEsQMAiDB2AAARxg4AIMLYAQBEGDsA\ngAhjBwAQYewAACKMHQBAhLEDAIgwdgAAEcYOACDC2AEARBg7AIAIYwcAEGHsAAAijB0AQISx\nAwCIMHYAABHGDgAgwtgBAEQYOwCACGMHABBh7AAAIowdAECEsQMAiDB2AAARxg4AIMLYAQBE\nGDsAgAhjBwAQYewAACKMHQBAhLEDAIgwdgAAEcYOACDC2AEARBg7AIAIYwcAEGHsAAAijB0A\nQISxAwCIMHYAABHGDgAgwtgBAEQYOwCACGMHABBh7AAAIowdAECEsQMAiDB2AAARxg4AIMLY\nAQBEGDsAgAhjBwAQYewAACKMHQBAhLEDAIgwdgAAEcYOACDC2AEARBg7AIAIYwcAEGHsAAAi\njB0AQISxAwCIMHYAABHGDgAgwtgBAEQYOwCACGMHABBh7AAAIowdAECEsQMAiDB2AAARxg4A\nIMLYAQBEGDsAgAhjBwAQYewAACKMHQBAhLEDAIgwdgAAEcYOACDC2AEARBg7AIAIYwcAEGHs\nAAAijB0AQISxAwCIMHYAABHGDgAgwtgBAEQYOwCACGMHABBh7AAAIowdAECEsQMAiDB2AAAR\nxg4AIMLYAQBEGDsAgAhjBwAQYewAACKMHQBAhLEDAIgwdgAAEcYOACDC2AEARBg7AIAIYwcA\nEGHsAAAijB0AQISxAwCIMHYAABHGDgAgwtgBAEQYOwCACGMHABBh7AAAIowdAECEsQMAiDB2\nAAARxg4AIMLYAQBEGDsAgAhjBwAQYewAACKMHQBAhLEDAIgwdgAAEcYOACDC2AEARBg7AIAI\nYwcAEGHsAAAijB0AQISxAwCIMHYAABHGDgAgwtgBAEQYOwCACGMHABBh7AAAIowdAECEsQMA\niDB2AAARxg4AIMLYAQBEGDsAgAhjBwAQYewAACKMHQBAhLEDAIgwdgAAEcYOACDC2AEARBg7\nAIAIYwcAEGHsAAAijB0AQISxAwCIMHYAABHGDgAgwtgBAEQYOwCACGMHABBh7AAAIowdAECE\nsQMAiDB2AAARxg4AIMLYAQBEGDsAgAhjBwAQYewAACKMHQBAhLEDAIgwdgAAEcYOACDC2AEA\nRBg7AIAIYwcAEGHsAAAijB0AQISxAwCIMHYAABHGDgAgwtgBAEQYOwCACGMHABBh7AAAIowd\nAECEsQMAiDB2AAARxg4AIMLYAQBEGDsAgAhjBwAQYewAACKMHQBAhLEDAIgwdgAAEcYOACDC\n2AEARBg7AIAIYwcAEGHsAAAijB0AQISxAwCIMHYAABHGDgAgwtgBAEQYOwCACGMHABBh7AAA\nIowdAECEsQMAiDB2AAARxg4AIMLYAQBEGDsAgAhjBwAQYewAACKMHQBAhLEDAIgwdgAAEcYO\nACDC2AEARBg7AIAIYwcAEGHsAAAijB0AQISxAwCIMHYAABHGDgAgwtgBAEQYOwCACGMHABBh\n7AAAIowdAECEsQMAiDB2AAARxg4AIMLYAQBEGDsAgAhjBwAQYewAACKMHQBAhLEDAIgwdgAA\nEcYOACDC2AEARBg7AIAIYwcAEGHsAAAijB0AQISxAwCIMHYAABHGDgAgwtgBAEQYOwCACGMH\nABBh7AAAIowdAECEsQMAiDB2AAARxg4AIMLYAQBEGDsAgAhjBwAQYewAACKMHQBAhLEDAIgw\ndgAAEcYOACDC2AEARBg7AIAIYwcAEGHsAAAijB0AQISxAwCIMHYAABHGDgAgwtgBAEQYOwCA\nCGMHABBh7AAAIowdAECEsQMAiDB2AAARxg4AIMLYAQBEGDsAgAhjBwAQYewAACKMHQBAhLED\nAIgwdgAAEcYOACDC2AEARBg7AIAIYwcAEGHsAAAijB0AQISxAwCIMHYAABHGDgAgwtgBAEQY\nOwCACGMHABBh7AAAIowdAECEsQMAiDB2AAARxg4AIMLYAQBEGDsAgAhjBwAQYewAACKMHQBA\nhLEDAIgwdgAAEcYOACDC2AEARBg7AIAIYwcAEGHsAAAijB0AQISxAwCIMHYAABHGDgAgwtgB\nAEQYOwCACGMHABBh7AAAIowdAECEsQMAiDB2AAARxg4AIMLYAQBEGDsAgAhjBwAQYewAACKM\nHQBAhLEDAIgwdgAAEcYOACDC2AEARBg7AIAIYwcAEGHsAAAijB0AQISxAwCIMHYAABHGDgAg\nwtgBAEQYOwCACGMHABBh7AAAIowdAECEsQMAiDB2AAARxg4AIMLYAQBEGDsAgAhjBwAQYewA\nACKMHQBAhLEDAIgwdgAAEcYOACDC2AEARBg7AIAIYwcAEGHsAAAijB0AQISxAwCIMHYAABHG\nDgAgwtgBAEQYOwCACGMHABBh7AAAIowdAECEsQMAiDB2AAARxg4AIMLYAQBEGDsAgAhjBwAQ\nYewAACKMHQBAhLEDAIgwdgAAEcYOACDC2AEARGzthQmNqwN9XAAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Figure 7: Bike ridership throughout the day\n",
    "bike_data %>% \n",
    "  group_by(customer_type, time) %>% \n",
    "  summarise(total_number_of_rides = n()) %>% \n",
    "  ggplot(aes(x = time, y = total_number_of_rides, color = customer_type, group = customer_type)) + geom_line() + \n",
    "  scale_y_continuous(labels = scales::comma) + scale_x_datetime(date_breaks = \"1 hour\",\n",
    "                                                                date_labels = \"%H:%M\", expand = c(0,0))+\n",
    "  scale_color_manual(values = c(\"#DC3220\", \"#005AB5\")) + theme(axis.text.x = element_text(angle = 45)) + \n",
    "  labs(x = 'Time', y = 'Total Number of Rides', title = 'Bike Rentals Distributed Throughout the Day',\n",
    "       color = \"Type of Customer\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6fb3259a",
   "metadata": {
    "papermill": {
     "duration": 0.175997,
     "end_time": "2022-01-07T18:53:49.124276",
     "exception": false,
     "start_time": "2022-01-07T18:53:48.948279",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Act"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 112.995908,
   "end_time": "2022-01-07T18:53:49.610421",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-01-07T18:51:56.614513",
   "version": "2.3.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
