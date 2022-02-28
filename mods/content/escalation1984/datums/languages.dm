//coldwar languages
/decl/language/escalation
	name = "Escalation language"
	desc = "Nothing. Just code stuff"
	speech_verb = "says"
	whisper_verb = "whispers"
	category = /decl/language/escalation
	flags = RESTRICTED
	exclaim_verb = list("exclaims", "shouts", "yells")

/decl/language/escalation/get_spoken_verb(msg_end)
	switch(msg_end)
		if("!")
			return pick(exclaim_verb)
		if("?")
			return pick(ask_verb)
	return pick(speech_verb)

/decl/language/escalation/russian
	name = "Russian"
	desc = "This is the languaged used by the Soviet Army."
	colour = "russian"
	key = "r"
	syllables = list("al", "an", "bi", "ve", "vo", "go", "de", "el", "en", "er", "et", "ka", "ko", "la", "li", "lo", "l'", "na", "ne", "ni", "no", "ov", "ol", "on", "or", "slog", "ot", "po", "pr", "ra", "re", "ro", "st", "ta", "te", "to", "t'", "at'", "bil", "ver", "ego", "eni", "enn", "est", "kak", "l'n", "ova", "ogo", "ol'", "oro", "ost", "oto", "pri", "pro", "sta", "stv", "tor", "chto", "eto")

/decl/language/escalation/czech
	name = "Czech"
	desc = "This is the languaged used by the CSLA."
	colour = "czech"
	key = "z"
	syllables = list("on", "ot", "ude", "lal", "kniz", "lit", "ovat", "tat", "kup", "sat", "vy", "konat", "vyt", "rob", "rhein", "zaj", "lat", "voz", "ic", "na", "do", "ba", "pod", "pid", "mi")

/decl/language/escalation/english
	name = "English"
	desc = "This is the languaged used by the American Army."
	colour = "english"
	key = "e"
	syllables = list("al", "an", "ar", "as", "at", "ea", "ed", "en", "er", "es", "ha", "he", "hi", "in", "is", "it", "le", "me", "nd", "ne", "ng", "nt", "on", "or", "ou", "re", "se", "st", "te", "th", "ti", "to", "ve", "wa", "all", "and", "are", "but", "ent", "era", "ere", "eve", "for", "had", "hat", "hen", "her", "hin", "his", "ing", "ion", "ith", "not", "ome", "oul", "our", "sho", "ted", "ter", "tha", "the", "thi", "tio", "uld", "ver", "was", "wit", "you")

/decl/language/escalation/german
	name = "German"
	desc = "This is the languaged used by the Bundeswehr, Bundesheer and the NVADDR."
	colour = "german"
	key = "g"
	syllables = list("die", "das", "wein", "mir", "und", "wier", "ein", "nein", "gen", "en", "sauen", "bien", "nien", "rien", "rhein", "deut", "der", "lieb", "en", "stein", "nein", "ja", "wolle", "sil", "be")

/decl/language/escalation/finnish
	name = "Finnish"
	desc = "This is the languaged used by the Finnish Militaria."
	colour = "finnish"
	key = "f"
	syllables = list("mine", "sine", "hen", "me", "te", "he", "tame", "tuo", "se", "name", "nuo", "ne", "kuka", "mika", "ken", "kumpi", "joka", "mike", "toinen", "itse", "Ei", "Anteeksi", "Kiitos")

/decl/language/escalation/spanish
	name = "Spanish"
	desc = "This is the languaged used by the Spanish Army."
	colour = "spanish"
	key = "l"
	syllables = list("va", "que", "qi", "si", "non", "te", "ta", "juz", "gue", "vez", "fe", "he", "hi", "in", "is", "it", "la", "re", "tin", "pa", "sa", "arr", "vi", "va", "mie", "do", "ri", "tos", "tra", "ma", "ra", "jo", "ero", "dad", "ejo", "ala", "ches", "bol", "bras", "som", "san", "bre", "erpo", "feliz", "juevez", "yes", "oje", "nol", "esp", "co", "un", "dos", "tres", "favor", "por", "bien", "como", "luz", "del", "ahi", "ajos", "veo", "tor", "apia", "riza", "hombre", "dador", "pindejo")

/decl/language/escalation/french
	name = "French"
	desc = "This is the languaged used by the French Army."
	colour = "english"
	key = "h"
	syllables = list("voux", "que", "qi", "cha", "non", "une", "la", "le", "l'", "j'", "d'", "mer", "rea", "lite", "ite", "eta", "la", "moi", "toi", "nous", "et", "tu", "tou", "jours", "mains", "moin", "les", "mise", "tra", "ma", "ra", "je", "nom", "lier", "ejo", "jeu", "nesse", "che", "pere", "som", "san", "bre", "sou", "vent", "mer", "les", "eux", "aux", "oux", "iux", "tiere", "dos", "tres", "etre", "ne", "bien", "tous", "lus", "del", "j'etat", "est", "sans", "eils", "guerre", "oire", "noire", "beaucoup", "merci")

/decl/language/escalation/polish
	name = "Polish"
	desc = "This is the languaged used by the Polish People's Republic."
	colour = "finnish"
	key = "p"
	syllables = list("al", "an", "bi", "ve", "vo", "go", "de", "el", "en", "er", "et", "ka", "ko", "la", "li", "lo", "l'", "na", "ne", "ni", "no", "ov", "ol", "on", "or", "slog", "ot", "po", "pr", "ra", "re", "ro", "st", "ta", "te", "to", "t'", "at'", "bil", "ver", "ego", "eni", "enn", "est", "kak", "l'n", "ova", "ogo", "ol'", "oro", "ost", "oto", "pri", "pro", "sta", "stv", "tor", "chto", "eto")

/proc/add_team_language(mob/living/carbon/human/target)
	. = FALSE
	if(!istype(target))
		return

	if(!target.chosenSlot || !target.chosenSlot.faction_tag)
		return

	target.remove_language(/decl/language/human/common)

	var/decl/language/language = null
	switch(target.chosenSlot.faction_tag)
		if("usmc")
			target.add_language(/decl/language/escalation/english)
			language = /decl/language/escalation/english
		if("usa")
			target.add_language(/decl/language/escalation/english)
			language = /decl/language/escalation/english
		if("baf")
			target.add_language(/decl/language/escalation/english)
			language = /decl/language/escalation/english
		if("cccp")
			target.add_language(/decl/language/escalation/russian)
			language = /decl/language/escalation/russian
		if("bund")
			target.add_language(/decl/language/escalation/german)
			language = /decl/language/escalation/german
		if("nvaddr")
			target.add_language(/decl/language/escalation/german)
			language = /decl/language/escalation/german
		if("finn")
			target.add_language(/decl/language/escalation/finnish)
			language = /decl/language/escalation/finnish
		if("csla")
			target.add_language(/decl/language/escalation/czech)
			language = /decl/language/escalation/czech
		if("heer")
			target.add_language(/decl/language/escalation/german)
			language = /decl/language/escalation/german
		if("esp")
			target.add_language(/decl/language/escalation/spanish)
			language = /decl/language/escalation/spanish
		if("fra")
			target.add_language(/decl/language/escalation/french)
			language = /decl/language/escalation/french
	if(language)
		target.set_default_language(language)

	return TRUE

/proc/add_other_languages(mob/living/carbon/human/target)
	if(!istype(target))
		return

	if(!target.chosenSlot || !target.chosenSlot.also_known_languages.len)
		return

	for(var/i in target.chosenSlot.also_known_languages)
		if(prob(target.chosenSlot.also_known_languages[i]))
			target.add_language(i)
