{smcl}

wordcloud2: Generate word clouds natively in Stata's graph editor without transforming your text data.

{p 8 17 2} 
{cmd:wordcloud2}
{it:textvar}
[{help if}] 
[{help in}]{cmd:,}
[{cmdab:pal:ette(}{it:string}{cmd:)} 
{cmdab:exc:lude(}{it:stringlist}{cmd:)} 
{cmdab:keep:common}
{cmdab:wordc:ount(}{it:int}{cmd:)} 
{cmdab:words:ize(}{it:real}{cmd:)} 
{cmdab:t:itle(}{it:string}{cmd:)}
{cmdab:sub:title(}{it:string}{cmd:)}
{cmdab:n:ote(}{it:string}{cmd:)}
{it:graph_options}]

{title:Description} 

{p 4 4 2} 
{cmd:wordcloud2} splits a text field into discrete words, calculates the frequency of those words, and plots the relative frequency in a "cloud" format. 
Compared to other word cloud packages for Stata, this is completely native within Stata's graph editor. 
It also does not require prior formatting of the text input data.

{p 4 4 2} 
The graph plot placements are generated randomly. If you do not like the placement, run the command again and it will re-randomize.

{title:Options}

{p 4 8 2}
{cmd:palette()} specifies the colors of the words in the cloud based on {help colorpalette}. 
You can also specify a single color value in this option, such as {it:gs6}, if you do not want any variation in color.

{p 4 8 2}
{cmd:exclude()} allows users to exclude specific words from the cloud. Enter the values as distinct strings separated by a space. Include all words as lower case without non-letter characters. 
Example: {cmd:exclude("product" "easy" "im" "its")}

{p 4 8 2}
{cmd:keepcommon} specifies that you would like to include common words that I have automatically removed from the cloud. 
This can be specified in combination with {cmd:exclude()} for complete control over which words are included.
I have chosen common words such as "a", "this", "to", etc. to remove. I have also removed non-ASCII characters as a default.
This option adds all of those exclusions back into the graph.

{p 4 8 2}
{cmd:wordcount()} specifies the total unique number of words to include in the cloud. 
This program sorts the data by word frequency, with the default option keeping the top 25 most common words from your input.
Extending the word count to 40 would keep the top 40 most common words, and so on. The maximum allowable unique words is 3,000.

{p 4 8 2}
{cmd:wordsize()} adjusts the size of each word in the plot. The input is based on scale, with the default being 1.25.
If you would prefer the entire graph to increase in size, you could specify {cmd:wordsize(1.5)}. 
It is unlikely a scaled size greater than 2 will be of much use.

{p 4 8 2}
{cmd:title()} allows all options available under {help twoway}.

{p 4 8 2}
{cmd:subtitle()} allows all options available under {help twoway}.

{p 4 8 2}
{cmd:note()} allows all options available under {help twoway}.

{p 4 8 2}
Select {it:graph_options} are allowed with this command. 

{title:Examples} 

Use random text data generated for this purpose.
{p 4 8 2}{cmd:. import excel "https://raw.githubusercontent.com/jareddc101/wordcloud2/refs/heads/main/wordcloud2_sample.xlsx", clear firstrow}{p_end}

Simple syntax using default options.
{p 4 8 2}{cmd:. wordcloud2 long_response}{p_end}

Adjust the word count to examine the impact on relative frequency.
{p 4 8 2}{cmd:. gen response_dup = long_response}{p_end}
{p 4 8 2}{cmd:. replace response_dup = "me me me me me me me me me me me me me me me me me me me me me me me me me me me me me me me me me me me" if survey_id == 4}{p_end}
{p 4 8 2}{cmd:. wordcloud2 response_dup}{p_end}

Change the palette to an available option in {help colorpalette}.
{p 4 8 2}{cmd:. wordcloud2 response_dup, pal(economist)}{p_end}

Change the palette to a single color for all words in the cloud.
{p 4 8 2}{cmd:. wordcloud2 long_response, palette(black)}{p_end}

Use all other {help twoway} options.
{p 4 8 2}{cmd:. wordcloud2 response_dup, pal(carto) name(wordcloud_test, replace) title("Jared's Wordcloud") subtitle("Just a test") note("These data are random.")}{p_end}

{title:Author} 

{p 4 4 2}Jared D. Colston{break} 
         jareddc101@gmail.com

