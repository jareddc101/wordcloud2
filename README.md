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

Use random text data generated for this package.

```stata
import excel "https://raw.githubusercontent.com/jareddc101/wordcloud2/refs/heads/main/wordcloud2_sample.xlsx", clear
```

Simple syntax using default options:

```
wordcloud2 long_response
```

<img src="/figures/figure1.png" width="100%">

Adjust the word count to examine the impact on relative frequency:

```
gen response_dup = long_response
replace response_dup = "me me me me me me me me me me me me me me me me me me me me me me me me me me me me me me me me me me me" if survey_id == 4
wordcloud2 response_dup
```

<img src="/figures/figure2.png" width="100%">

Change the palette to an available option in colorpalette:
```
wordcloud2 response_dup, pal(economist)
```

<img src="/figures/figure3.png" width="100%">


Change the palette to a single color for all words in the cloud:

```
wordcloud2 long_response, palette(black)
```

<img src="/figures/figure4.png" width="100%">

Use all other twoway options:

```
wordcloud2 response_dup, pal(carto) name(wordcloud_test, replace) title("Jared's Wordcloud") subtitle("Just a test") note("These data are random.")
```

<img src="/figures/figure5.png" width="100%">

## Feedback

Please open an [issue](https://github.com/jareddc101/wordcloud2/issues) to report errors, feature enhancements, and/or other requests. 


## Change log

**v1.0 (19 Feb 2026)**
- First release