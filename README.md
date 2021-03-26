# Ubiquitous Digital Technologies and Spatial Structure; an update

[Emmanouil Tranos](https://etranos.info/)<sup>1</sup> and [Yannis M. Ioannides](https://sites.tufts.edu/yioannides/)<sup>2</sup>

<sup>1</sup> University of Bristol and The Alan Turing Institute, [e.tranos@bristol.ac.uk](mailto:e.tranos@bristol.ac.uk), [@emmanouiltranos](https://twitter.com/emmanouiltranos)

<sup>2</sup> Tufts University, [Yannis.Ioannides@tufts.edu](mailto:Yannis.Ioannides@tufts.edu), [@profymi](https://twitter.com/profymi)

This is the depository for the 'Ubiquitous Digital Technologies and Spatial Structure; an update' paper that will appear in *PLOS One*.

## Abstract
This paper examines the impact of widespread adoption of information and communication technologies (ICT) on urban structure worldwide. Has it offset agglomeration benefits and led to more dispersed spatial structures, or has it strengthened urban externalities and thus resulted in more concentrated spatial structures? Theoretical and empirical studies on this question have produced contradictory findings. The present study recognizes that assumptions made earlier about the evolution of technological capabilities do not necessarily hold today. As cutting-edge digital technologies have matured considerably, a fresh look at this question is called for.

The paper addresses this issue by means of several data sets using instrumental variable methods. One is the UN data on Urban Settlements with more than $300,000$ inhabitants. Estimation methods with these data show that increased adoption of ICT  has resulted in national urban systems that are less uniform in terms of city sizes and are characterized by higher population concentrations in larger cities, when concentration is proxied the Pareto (Zipf) coefficient for national city size distributions. Two, is disaggregated data for the urban systems of the US, defined as Micropolitan and Metropolitan Areas, and for the UK, defined as Built-up Areas in England and Wales, respectively. These data allow for the impacts to be studied for cities smaller than those included in the cross-country data. Increased internet usage improved a city’s ranking in the US urban system. Similarly, increased download speed improves a built-up area’s ranking in England and Wales.

## Data

All the necessary data to reproduce the analysis can be found in 
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4630729.svg)](https://doi.org/10.5281/zenodo.4630729).

A local copy can be found in: 

`ict.un.us.uk/data/data_inter/`.
 
## Code

The paper consists of (i) a cross-county case study, (ii) a US and (iii) a UK one. 
The necessary `.Rmd` files -- `un.Rmd`, `usa.Rmd` and `uk.Rmd` -- can be found in:

`/ict.un.us.uk/src/`.

The `src` folder also contains three `.Rmd` files for the three Supplementary Materials 
that accompany the paper -- `s1.Rmd`, `s2.Rmd`, `s3.Rmd`.
