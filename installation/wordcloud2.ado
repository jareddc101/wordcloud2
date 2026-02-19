*! wordcloud2 v1.0 (2026.02.18)
*! Jared Colston

capture program drop wordcloud2 
program wordcloud2, rclass sortpreserve
version 15

syntax name [if] [in], [PALette(string) Note(passthru) Title(passthru) SUBTitle(passthru) *]

	// check dependencies
	cap findfile colorpalette.ado
	if _rc != 0 {
		display as error "The palettes package is missing. Install the {stata ssc install palettes, replace:palettes} and {stata ssc install colrspace, replace:colrspace} packages."
		exit
	}	

	marksample touse, strok

preserve
quietly {

	keep if `touse'
  
	// Put data in correct format
	keep `namelist' 
	gen wordcloud2_id = _n
	split `namelist', p(" ")
	drop `namelist' 
	reshape long `namelist', i(wordcloud2_id) j(temp)
	replace `namelist' = trim(`namelist')
	replace `namelist' = strlower(`namelist')
	
	// Remove special characters and common words
	replace `namelist' = subinstr(`namelist',",","",.)
	replace `namelist' = "" if inlist(`namelist',"a","this","the","i","to","it","at","did","and")
	replace `namelist' = "" if inlist(`namelist',"not")
	
	// Calculate frequency of words and generate plot placement
	drop if missing(`namelist')
	duplicates tag `namelist', gen(wordcloud2_dup)
	replace wordcloud2_dup = (wordcloud2_dup) + 1
	duplicates drop `namelist', force
	gen wordcloud2_y = runiform(1,100)
	gen wordcloud2_x = runiform(1,100)
	drop wordcloud2_id 
	gen wordcloud2_id = _n
	
	// Convert frequency to relative size 
	egen sum_wordcloud2_dup = sum(wordcloud2_dup)
	replace wordcloud2_dup = ((wordcloud2_dup / sum_wordcloud2_dup) * 100)
	
	// Adjust colors using palette selection 
	if "`palette'" == "" {
		local palette tableau
	}
	else {
		tokenize "`palette'", p(",")
		local palette  `1'
		local poptions `3'
	}
	
	// Draw the individual plots
	levelsof wordcloud2_id, local(id_local)
	foreach x of local id_local {
		local size = (wordcloud2_dup[`x'])
		
		summ wordcloud2_id, d
		colorpalette `palette', nograph	n(`r(max)') `poptions'
	
		if (`x' == 1) {
			local gra`x' "twoway scatter wordcloud2_y wordcloud2_x if wordcloud2_id == `x', mlabel(`namelist') mlabposition(0) mcolor(none) mlabsize(`size') mlabcolor("`r(p`x')'") "
		}
		else local gra`x' "|| scatter wordcloud2_y wordcloud2_x if wordcloud2_id == `x', mlabel(`namelist') mlabposition(0) mcolor(none) mlabsize(`size') mlabcolor("`r(p`x')'") "
		
		local gra_comb "`gra_comb' `gra`x''"
		
		di "`r(p2)'"
	}

	// Combine the plots and establish preferences
	`gra_comb' ///
		ytitle("") xtitle("") ///
		yscale(range(-25 125) noline) xscale(range(-25 125) noline) ///
		legend(off) ///
		ylabel(none,nogrid) xlabel(none,nogrid) ///
		`title' `note' `subtitle' `options'

}	
restore		
end

	
******************
* END OF PROGRAM *
******************	
	
	
	
	
	
	
	
	
	
	
	
	
