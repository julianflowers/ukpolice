% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/crime.R
\name{ukp_crime}
\alias{ukp_crime}
\title{Find street level crime within a specified distance or area}
\usage{
ukp_crime(lat, lng, date = NULL, ...)
}
\arguments{
\item{lat}{latitude of the requested crime area}

\item{lng, }{longitude of the requested crime area}

\item{date, }{Optional. (YYY-MM), limit results to a specific month. The latest month will be shown by default. e.g. date = "2013-01"}

\item{...}{further arguments passed to or from other methods. For example,
verbose option can be added with \code{ukp_api("call", config = httr::verbose())}. See more in ?httr::GET documentation
(\url{https://cran.r-project.org/web/packages/httr/}) and
(\url{https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html}).}
}
\value{
a tibble with the columns:
\itemize{
\item category: Category of the crime
(\url{https://data.police.uk/docs/method/crime-street/})
\item persistent_id: 64-character unique identifier for that crime.
(This is different to the existing 'id' attribute, which is not
guaranteed to always stay the same for each crime.)
\item date: Date of the crime YYYY-MM
\item latitude: Latitude
\item longitude: Longitude
\item street_id: Unique identifier for the street
\item street_name: Name of the location. This is only an approximation of
where the crime happened
\item context: Extra information about the crime (if applicable)
\item id: ID of the crime. This ID only relates to the API, it is NOT a
police identifier
\item location_type: The type of the location. Either Force or BTP:
Force indicates a normal police force location; BTP indicates a British
Transport Police location. BTP locations fall within normal police
force boundaries.
\item location_subtype: For BTP locations, the type of location at which
this crime was recorded.
\item outcome_status: The category and date of the latest recorded
outcome for the crime
}
}
\description{
Crimes at street-level; either within a 1 mile radius of a single point, or
within a custom area. The street-level crimes returned in the API are
only an approximation of where the actual crimes occurred, they are not
the exact locations. See the about page
(\url{https://data.police.uk/about/#location-anonymisation}) for more
information about location anonymisation. Note that crime levels may
appear lower in Scotland, as only the British Transport Police provide
this data.
}
\note{
The API will return a 400 status code in response to a GET request
longer than 4094 characters. For submitting particularly complex poly
parameters, consider using POST instead.

more documentation here: \url{https://data.police.uk/docs/method/crime-street/}
}
\examples{

ukp_crime_data <- ukp_crime(lat = 52.629729, lng = -1.131592)

head(ukp_crime_data)

}
