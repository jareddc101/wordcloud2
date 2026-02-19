# wordcloud2
Stata package to generate word clouds natively in Stata's graph editor without transforming your text data.

# wordcloud2 v1.0
(19 Feb 2026)

This package provides the ability to create word cloud plots from text data natively in Stata's graph editor.

The package is still beta and is being constantly improved. It might still be missing checks and features. 


## Installation

The package can currently be installed from GitHub only:

```
net install wordcloud2, from("https://raw.githubusercontent.com/jareddc101/wordcloud2/main/installation/") replace
```

Even if you have the package installed, make sure that it is updated `ado update, update`.

## Syntax

The syntax for the latest version is as follows:

```stata
wordcloud2 strvar [if] [in], 
               [palette(color_palette_options) title(title_options) subtitle(subtitle_options) note(note_options) graph_options]
```

See the help file `help wordcloud2` for details.

## Citation guidelines
Software packages take countless hours of programming, testing, and bug fixing. If you use this package, then a citation would be highly appreciated. Suggested citations:


*in BibTeX*

```
@software{wordcloud2,
   author = {Colston, Jared},
   title = {Stata package ``wordcloud2''},
   url = {https://github.com/jareddc101/wordcloud2},
   version = {1.0},
   date = {2026-02-19}
}
```

*or simple text*

```
Colston, J. (2026). Stata package "wordcloud2" version 1.0. Release date 19 February 2026. https://github.com/jareddc101/wordcloud2.
```



## Examples

```stata
import delimited "https://raw.githubusercontent.com/jdcols01/trendline/refs/heads/main/world_gdp.csv", clear
encode region, gen(regnum)
```

Overall trend lines when no category is specified:

```
trendline gdp_percap, time(year)
```

<img src="/figures/figure1.png" width="100%">

Create trend lines by category:

```
trendline gdp_percap, time(year) category(regnum)
```

<img src="/figures/figure2.png" width="100%">

Change the aggregate statistic:
```
trendline gdp_percap, time(year) category(regnum) statistic(median)
```

<img src="/figures/figure3.png" width="100%">


Condition the trend lines based on select categories:

```
trendline gdp_percap if inlist(regnum,1,2), time(year) category(regnum)
```

<img src="/figures/figure4.png" width="100%">

Use all of the other twoway line options:

```
trendline gdp_percap if inlist(regnum,1,2), time(year) category(regnum) lpattern(dash)
```

<img src="/figures/figure5.png" width="100%">


```
trendline gdp_percap if inlist(regnum,1,2), time(year) category(regnum) lpattern(dash) scheme(s2color)
```

<img src="/figures/figure6.png" width="100%">

## Feedback

Please open an [issue](https://github.com/jareddc101/wordcloud2/issues) to report errors, feature enhancements, and/or other requests. 


## Change log

**v1.0 (19 Feb 2026)**
- First release