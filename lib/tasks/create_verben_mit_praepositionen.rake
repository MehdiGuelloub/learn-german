task create_verben_mit_praepositionen: :environment do
  verben_mit_praepositionen = [
    {
      word: "abhängen",
      meaning: "not important",
      example: "Ob wir fahren, hängt vom Wetter ab.",
      keyword: "vom",
      verb_preposition: "von",
      word_type: 1,
      article: 0
    },
    {
      word: "achten",
      meaning: "not important",
      example: "Bitte achte auf den neuen Mantel.",
      keyword: "auf",
      verb_preposition: "auf",
      word_type: 1,
      article: 0
    },
    {
      word: "anfangen",
      meaning: "not important",
      example: "Ich fange mit der Übung an.",
      keyword: "mit",
      verb_preposition: "mit",
      word_type: 1,
      article: 0
    },
    {
      word: "ankommen",
      meaning: "not important",
      example: "Es kommt auf den richtigen Preis an.",
      keyword: "auf",
      verb_preposition: "auf",
      word_type: 1,
      article: 0
    },
    {
      word: "antworten",
      meaning: "not important",
      example: "Bitte antworten Sie heute auf den Brief.",
      keyword: "auf",
      verb_preposition: "auf",
      word_type: 1,
      article: 0
    },
    {
      word: "sich ärgern",
      meaning: "not important",
      example: "Wir ärgern uns über den Regen.",
      keyword: "über",
      verb_preposition: "über",
      word_type: 1,
      article: 0
    },
    {
      word: "aufhören",
      meaning: "not important",
      example: "Er hört um 17.00 Uhr mit der Arbeit auf.",
      keyword: "mit",
      verb_preposition: "mit",
      word_type: 1,
      article: 0
    },
    {
      word: "aufpassen",
      meaning: "not important",
      example: "Ein Babysitter passt auf kleine Kinder auf.",
      keyword: "auf",
      verb_preposition: "auf",
      word_type: 1,
      article: 0
    },
    {
      word: "sich aufregen",
      meaning: "not important",
      example: "Deutsche regen sich über Unpünktlichkeit auf.",
      keyword: "über",
      verb_preposition: "über",
      word_type: 1,
      article: 0
    },
    {
      word: "ausgeben",
      meaning: "not important",
      example: "Frauen geben viel Geld für Schuhe aus.",
      keyword: "für",
      verb_preposition: "für",
      word_type: 1,
      article: 0
    },
    {
      word: "sich bedanken",
      meaning: "not important",
      example: "Ich bedanke mich herzlich bei dir.",
      keyword: "bei",
      verb_preposition: "bei",
      word_type: 1,
      article: 0
    },
    {
      word: "sich bedanken",
      meaning: "not important",
      example: "Martin bedankt sich für das Geschenk.",
      keyword: "für",
      verb_preposition: "für",
      word_type: 1,
      article: 0
    },
    {
      word: "beginnen",
      meaning: "not important",
      example: "Wir beginnen pünktlich mit dem Deutschkurs.",
      keyword: "mit",
      verb_preposition: "mit",
      word_type: 1,
      article: 0
    },
    {
      word: "sich bemühen",
      meaning: "not important",
      example: "Karla bemüht sich um eine Arbeit.",
      keyword: "um",
      verb_preposition: "um",
      word_type: 1,
      article: 0
    },
    {
      word: "berichten",
      meaning: "not important",
      example: "Der Reporter berichtet über die Wahlen.",
      keyword: "über",
      verb_preposition: "über",
      word_type: 1,
      article: 0
    },
    {
      word: "sich beschäftigen",
      meaning: "not important",
      example: "Ich beschäftige mich gern mit Pflanzen.",
      keyword: "mit",
      verb_preposition: "mit",
      word_type: 1,
      article: 0
    },
    {
      word: "sich beschweren",
      meaning: "not important",
      example: "Der Gast beschwert sich beim Kellner.",
      keyword: "bei",
      verb_preposition: "bei",
      word_type: 1,
      article: 0
    },
    {
      word: "bestehen",
      meaning: "not important",
      example: "Eheringe bestehen aus Gold.",
      keyword: "aus",
      verb_preposition: "aus",
      word_type: 1,
      article: 0
    },
    {
      word: "bestehen",
      meaning: "not important",
      example: "Ich bestehe auf sofortige Bezahlung des Autos.",
      keyword: "auf",
      verb_preposition: "auf",
      word_type: 1,
      article: 0
    },
    {
      word: "sich beteiligen",
      meaning: "not important",
      example: "Viele Studenten beteiligen sich an den Streiks.",
      keyword: "an",
      verb_preposition: "an",
      word_type: 1,
      article: 0
    },
    {
      word: "sich bewerben",
      meaning: "not important",
      example: "Er bewirbt sich bei einer Bäckerei.",
      keyword: "bei",
      verb_preposition: "bei",
      word_type: 1,
      article: 0
    },
    {
      word: "sich bewerben",
      meaning: "not important",
      example: "Sie bewirbt sich um eine Stelle als Sekretärin.",
      keyword: "um",
      verb_preposition: "um",
      word_type: 1,
      article: 0
    },
    {
      word: "sich beziehen",
      meaning: "not important",
      example: "Meine Frage bezieht sich auf Ihr Angebot.",
      keyword: "auf",
      verb_preposition: "auf",
      word_type: 1,
      article: 0
    },
    {
      word: "bitten",
      meaning: "not important",
      example: "Der Redner bittet um Aufmerksamkeit.",
      keyword: "um",
      verb_preposition: "um",
      word_type: 1,
      article: 0
    },
    {
      word: "danken",
      meaning: "not important",
      example: "Sam dankt für Ritas Hilfe.",
      keyword: "für",
      verb_preposition: "für",
      word_type: 1,
      article: 0
    },
    {
      word: "denken",
      meaning: "not important",
      example: "Maria denkt oft an den Urlaub.",
      keyword: "an",
      verb_preposition: "an",
      word_type: 1,
      article: 0
    },
    {
      word: "diskutieren",
      meaning: "not important",
      example: "Das Kabinett diskutiert über eine neue Steuer.",
      keyword: "über",
      verb_preposition: "über",
      word_type: 1,
      article: 0
    },
    {
      word: "einladen",
      meaning: "not important",
      example: "Ich lade dich zu meinem Geburtstag ein.",
      keyword: "zu",
      verb_preposition: "zu",
      word_type: 1,
      article: 0
    },
    {
      word: "sich entscheiden",
      meaning: "not important",
      example: "Frauen entscheiden sich gern für Gold.",
      keyword: "für",
      verb_preposition: "für",
      word_type: 1,
      article: 0
    },
    {
      word: "sich entschließen",
      meaning: "not important",
      example: "Karl entschließt sich zu einem Studium.",
      keyword: "zu",
      verb_preposition: "zu",
      word_type: 1,
      article: 0
    },
    {
      word: "sich entschuldigen",
      meaning: "not important",
      example: "Mia entschuldigt sich bei ihrem Mann.",
      keyword: "bei",
      verb_preposition: "bei",
      word_type: 1,
      article: 0
    },
    {
      word: "sich entschuldigen",
      meaning: "not important",
      example: "Ich entschuldige mich für das Verhalten meiner Tochter.",
      keyword: "für",
      verb_preposition: "für",
      word_type: 1,
      article: 0
    },
    {
      word: "erfahren",
      meaning: "not important",
      example: "Heute haben wir von dem Bauprojekt erfahren.",
      keyword: "von",
      verb_preposition: "von",
      word_type: 1,
      article: 0
    },
    {
      word: "sich erholen",
      meaning: "not important",
      example: "Von dem Schock muss ich mich erst erholen.",
      keyword: "Von",
      verb_preposition: "von",
      word_type: 1,
      article: 0
    },
    {
      word: "sich erinnern",
      meaning: "not important",
      example: "Wir erinnern uns gern an unser erstes Ehejahr.",
      keyword: "an",
      verb_preposition: "an",
      word_type: 1,
      article: 0
    },
    {
      word: "erkennen",
      meaning: "not important",
      example: "Man erkennt Pinocchio an seiner langen Nase.",
      keyword: "an",
      verb_preposition: "an",
      word_type: 1,
      article: 0
    },
    {
      word: "sich erkundigen",
      meaning: "not important",
      example: "Oma erkundigt sich oft nach meinen Plänen.",
      keyword: "nach",
      verb_preposition: "nach",
      word_type: 1,
      article: 0
    },
    {
      word: "erschrecken",
      meaning: "not important",
      example: "Die Frau erschrickt über eine Maus.",
      keyword: "über",
      verb_preposition: "über",
      word_type: 1,
      article: 0
    },
    {
      word: "erzählen",
      meaning: "not important",
      example: "Ein Ostberliner erzählt über sein Leben in der ehemaligen DDR.",
      keyword: "über",
      verb_preposition: "über",
      word_type: 1,
      article: 0
    },
    {
      word: "erzählen",
      meaning: "not important",
      example: "Der Bischoff erzählt von der Reise nach Rom.",
      keyword: "von",
      verb_preposition: "von",
      word_type: 1,
      article: 0
    },
    {
      word: "fragen",
      meaning: "not important",
      example: "Die Journalistin fragt nach den Konsequenzen derGesetzesänderung.",
      keyword: "nach",
      verb_preposition: "nach",
      word_type: 1,
      article: 0
    },
    {
      word: "sich freuen",
      meaning: "not important",
      example: "Kinder freuen sich auf Weihnachten.",
      keyword: "auf",
      verb_preposition: "auf",
      word_type: 1,
      article: 0
    },
    {
      word: "sich freuen",
      meaning: "not important",
      example: "Jeder freut sich über eine Gehaltserhöhung.",
      keyword: "über",
      verb_preposition: "über",
      word_type: 1,
      article: 0
    },
    {
      word: "gehen",
      meaning: "not important",
      example: "Immer geht es um Geld.",
      keyword: "um",
      verb_preposition: "um",
      word_type: 1,
      article: 0
    },
    {
      word: "gehören",
      meaning: "not important",
      example: "Das Elsass gehört zu Frankreich.",
      keyword: "zu",
      verb_preposition: "zu",
      word_type: 1,
      article: 0
    },
    {
      word: "sich gewöhnen",
      meaning: "not important",
      example: "Ich kann mich nicht an den Euro gewöhnen.",
      keyword: "an",
      verb_preposition: "an",
      word_type: 1,
      article: 0
    },
    {
      word: "glauben",
      meaning: "not important",
      example: "Teenager glauben an die große Liebe.",
      keyword: "an",
      verb_preposition: "an",
      word_type: 1,
      article: 0
    },
    {
      word: "gratulieren",
      meaning: "not important",
      example: "Wir gratulieren dir zum 18. Geburtstag.",
      keyword: "zu",
      verb_preposition: "zu",
      word_type: 1,
      article: 0
    },
    {
      word: "halten",
      meaning: "not important",
      example: "Ich halte das für keine gute Idee.",
      keyword: "für",
      verb_preposition: "für",
      word_type: 1,
      article: 0
    },
    {
      word: "halten",
      meaning: "not important",
      example: "Kinder halten nicht viel von Ordnung.",
      keyword: "von",
      verb_preposition: "von",
      word_type: 1,
      article: 0
    },
    {
      word: "sich handeln",
      meaning: "not important",
      example: "Bei der Kopie handelt es sich nicht um Originalsoftware.",
      keyword: "um",
      verb_preposition: "um",
      word_type: 1,
      article: 0
    },
    {
      word: "handeln",
      meaning: "not important",
      example: "Märchen handeln von Gut und Böse.",
      keyword: "von",
      verb_preposition: "von",
      word_type: 1,
      article: 0
    },
    {
      word: "helfen",
      meaning: "not important",
      example: "Kann ich dir beim Tischdecken helfen?",
      keyword: "bei",
      verb_preposition: "bei",
      word_type: 1,
      article: 0
    },
    {
      word: "hindern",
      meaning: "not important",
      example: "Ein langsamer Fahrer hindert Greta am Überholen.",
      keyword: "an",
      verb_preposition: "an",
      word_type: 1,
      article: 0
    },
    {
      word: "hoffen",
      meaning: "not important",
      example: "Im März hoffen alle auf warme Frühlingstage.",
      keyword: "auf",
      verb_preposition: "auf",
      word_type: 1,
      article: 0
    },
    {
      word: "hören",
      meaning: "not important",
      example: "Ich habe seit Sonntag nichts von Piet gehört.",
      keyword: "von",
      verb_preposition: "von",
      word_type: 1,
      article: 0
    },
    {
      word: "sich informieren",
      meaning: "not important",
      example: "Auf der Messe kann man sich über die neue Technologie informieren.",
      keyword: "über",
      verb_preposition: "über",
      word_type: 1,
      article: 0
    },
    {
      word: "sich interessieren",
      meaning: "not important",
      example: "Monika interessiert sich für ein Smartphone.",
      keyword: "für",
      verb_preposition: "für",
      word_type: 1,
      article: 0
    },
    {
      word: "klagen",
      meaning: "not important",
      example: "Frauen klagen häufig über Kopfschmerzen.",
      keyword: "über",
      verb_preposition: "über",
      word_type: 1,
      article: 0
    },
    {
      word: "kämpfen",
      meaning: "not important",
      example: "Die Gewerkschaft kämpft für höhere Löhne.",
      keyword: "für",
      verb_preposition: "für",
      word_type: 1,
      article: 0
    },
    {
      word: "kommen",
      meaning: "not important",
      example: "In der Besprechung kam es zu einem Streit.",
      keyword: "zu",
      verb_preposition: "zu",
      word_type: 1,
      article: 0
    },
    {
      word: "sich konzentrieren",
      meaning: "not important",
      example: "Karl konzentriert sich auf seine Hausaufgaben.",
      keyword: "auf",
      verb_preposition: "auf",
      word_type: 1,
      article: 0
    },
    {
      word: "sich kümmern",
      meaning: "not important",
      example: "Im Pflegeheim kümmert man sich um alte Leute, die krank sind.",
      keyword: "um",
      verb_preposition: "um",
      word_type: 1,
      article: 0
    },
    {
      word: "lachen",
      meaning: "not important",
      example: "Über einen guten Witz muss man laut lachen.",
      keyword: "Über",
      verb_preposition: "über",
      word_type: 1,
      article: 0
    },
    {
      word: "leiden",
      meaning: "not important",
      example: "Jeder fünfte Manager leidet an Burn-out.",
      keyword: "an",
      verb_preposition: "an",
      word_type: 1,
      article: 0
    },
    {
      word: "leiden",
      meaning: "not important",
      example: "Kaffeetrinker leiden unter Schlafproblemen.",
      keyword: "unter",
      verb_preposition: "unter",
      word_type: 1,
      article: 0
    },
    {
      word: "nachdenken",
      meaning: "not important",
      example: "Beamte müssen nicht über ihre Rente nachdenken.",
      keyword: "über",
      verb_preposition: "über",
      word_type: 1,
      article: 0
    },
    {
      word: "protestieren",
      meaning: "not important",
      example: "Viele Menschen protestieren gegen Atomkraft.",
      keyword: "gegen",
      verb_preposition: "gegen",
      word_type: 1,
      article: 0
    },
    {
      word: "rechnen",
      meaning: "not important",
      example: "Im Januar muss man mit Schnee rechnen.",
      keyword: "mit",
      verb_preposition: "mit",
      word_type: 1,
      article: 0
    },
    {
      word: "reden",
      meaning: "not important",
      example: "Deine Mutter redet gern über Krankheiten.",
      keyword: "über",
      verb_preposition: "über",
      word_type: 1,
      article: 0
    },
    {
      word: "reden",
      meaning: "not important",
      example: "Großvater redet von den guten alten Zeiten.",
      keyword: "von",
      verb_preposition: "von",
      word_type: 1,
      article: 0
    },
    {
      word: "riechen",
      meaning: "not important",
      example: "Hier riecht es nach Kuchen.",
      keyword: "nach",
      verb_preposition: "nach",
      word_type: 1,
      article: 0
    },
    {
      word: "sagen",
      meaning: "not important",
      example: "Brigitte sagt über Dietmar, dass er oft lügt.",
      keyword: "über",
      verb_preposition: "über",
      word_type: 1,
      article: 0
    },
    {
      word: "sagen",
      meaning: "not important",
      example: "Was sagst du zu meinem neuen Haarschnitt?",
      keyword: "zu",
      verb_preposition: "zu",
      word_type: 1,
      article: 0
    },
    {
      word: "schicken",
      meaning: "not important",
      example: "Der Allgemeinmediziner schickt den Patienten zu einem Spezialisten.",
      keyword: "zu",
      verb_preposition: "zu",
      word_type: 1,
      article: 0
    },
    {
      word: "schimpfen",
      meaning: "not important",
      example: "Alle schimpfen über den Regen.",
      keyword: "über",
      verb_preposition: "über",
      word_type: 1,
      article: 0
    },
    {
      word: "schmecken",
      meaning: "not important",
      example: "Muscheln schmecken nach Meerwasser.",
      keyword: "nach",
      verb_preposition: "nach",
      word_type: 1,
      article: 0
    },
    {
      word: "schreiben",
      meaning: "not important",
      example: "Bitte schreibe noch heute an deine Mutter.",
      keyword: "an",
      verb_preposition: "an",
      word_type: 1,
      article: 0
    },
    {
      word: "sich schützen",
      meaning: "not important",
      example: "Den Computer des Ministers muss man vor Hackern schützen.",
      keyword: "vor",
      verb_preposition: "vor",
      word_type: 1,
      article: 0
    },
    {
      word: "sein",
      meaning: "not important",
      example: "Ich bin für die Abschaffung der Kinderarbeit.",
      keyword: "für",
      verb_preposition: "für",
      word_type: 1,
      article: 0
    },
    {
      word: "sein",
      meaning: "not important",
      example: "Viele sind gegen Steuererhöhungen.",
      keyword: "gegen",
      verb_preposition: "gegen",
      word_type: 1,
      article: 0
    },
    {
      word: "sorgen",
      meaning: "not important",
      example: "Kinder müssen im Alter für ihre Eltern sorgen.",
      keyword: "für",
      verb_preposition: "für",
      word_type: 1,
      article: 0
    },
    {
      word: "sprechen",
      meaning: "not important",
      example: "Ich spreche noch einmal mit deinem Vater.",
      keyword: "mit",
      verb_preposition: "mit",
      word_type: 1,
      article: 0
    },
    {
      word: "sprechen",
      meaning: "not important",
      example: "Lass uns über deine Zukunft sprechen.",
      keyword: "über",
      verb_preposition: "über",
      word_type: 1,
      article: 0
    },
    {
      word: "sterben",
      meaning: "not important",
      example: "Zwei Deutsche sind an der Grippe gestorben.",
      keyword: "an",
      verb_preposition: "an",
      word_type: 1,
      article: 0
    },
    {
      word: "streiten",
      meaning: "not important",
      example: "Ich möchte nicht mit dir streiten.",
      keyword: "mit",
      verb_preposition: "mit",
      word_type: 1,
      article: 0
    },
    {
      word: "streiten",
      meaning: "not important",
      example: "Die USA und Deutschland streiten über eine neue Strategie.",
      keyword: "über",
      verb_preposition: "über",
      word_type: 1,
      article: 0
    },
    {
      word: "teilnehmen",
      meaning: "not important",
      example: "Nordkorea nimmt an der Fußball-WM teil.",
      keyword: "an",
      verb_preposition: "an",
      word_type: 1,
      article: 0
    },
    {
      word: "telefonieren",
      meaning: "not important",
      example: "Hast du schon mit dem Arzt telefoniert?",
      keyword: "mit",
      verb_preposition: "mit",
      word_type: 1,
      article: 0
    },
    {
      word: "sich treffen",
      meaning: "not important",
      example: "Die Kanzlerin trifft sich täglich mit ihrem Pressesprecher.",
      keyword: "mit",
      verb_preposition: "mit",
      word_type: 1,
      article: 0
    },
    {
      word: "sich treffen",
      meaning: "not important",
      example: "Sie treffen sich nur zu einem kurzen Gespräch.",
      keyword: "zu",
      verb_preposition: "zu",
      word_type: 1,
      article: 0
    },
    {
      word: "überreden",
      meaning: "not important",
      example: "Kann ich dich zu einem Glas Wein überreden?",
      keyword: "zu",
      verb_preposition: "zu",
      word_type: 1,
      article: 0
    },
    {
      word: "sich unterhalten",
      meaning: "not important",
      example: "Der Sänger unterhält sich mit dem Bassisten.",
      keyword: "mit",
      verb_preposition: "mit",
      word_type: 1,
      article: 0
    },
    {
      word: "sich unterhalten",
      meaning: "not important",
      example: "Die Modedesigner unterhalten sich über die neuesten Trends.",
      keyword: "über",
      verb_preposition: "über",
      word_type: 1,
      article: 0
    },
    {
      word: "sich verabreden",
      meaning: "not important",
      example: "Heute verabrede ich mich mit einer Freundin.",
      keyword: "mit",
      verb_preposition: "mit",
      word_type: 1,
      article: 0
    },
    {
      word: "sich verabschieden",
      meaning: "not important",
      example: "Nun wollen wir uns von euch verabschieden.",
      keyword: "von",
      verb_preposition: "von",
      word_type: 1,
      article: 0
    },
    {
      word: "vergleichen",
      meaning: "not important",
      example: "Vergleichen Sie München mit Berlin.",
      keyword: "mit",
      verb_preposition: "mit",
      word_type: 1,
      article: 0
    },
    {
      word: "sich verlassen",
      meaning: "not important",
      example: "Auf mich kann man sich verlassen.",
      keyword: "Auf",
      verb_preposition: "auf",
      word_type: 1,
      article: 0
    },
    {
      word: "sich verlieben",
      meaning: "not important",
      example: "Britta hat sich in das alte Bauernhaus verliebt.",
      keyword: "in",
      verb_preposition: "in",
      word_type: 1,
      article: 0
    },
    {
      word: "sich verstehen",
      meaning: "not important",
      example: "Daniel versteht sich gut mit seinem Chef.",
      keyword: "mit",
      verb_preposition: "mit",
      word_type: 1,
      article: 0
    },
    {
      word: "verstehen",
      meaning: "not important",
      example: "Verstehst du etwas von Elektrik?",
      keyword: "von",
      verb_preposition: "von",
      word_type: 1,
      article: 0
    },
    {
      word: "sich vorbereiten",
      meaning: "not important",
      example: "Karl bereitet sich auf eine Präsentation vor.",
      keyword: "auf",
      verb_preposition: "auf",
      word_type: 1,
      article: 0
    },
    {
      word: "warnen",
      meaning: "not important",
      example: "Man hatte ihn vor den hohen Kosten für das alte Auto gewarnt.",
      keyword: "vor",
      verb_preposition: "vor",
      word_type: 1,
      article: 0
    },
    {
      word: "warten",
      meaning: "not important",
      example: "In Namibia wartet man lange auf einen Bus.",
      keyword: "auf",
      verb_preposition: "auf",
      word_type: 1,
      article: 0
    },
    {
      word: "sich wenden",
      meaning: "not important",
      example: "Bitte wenden Sie sich an die Buchhaltung.",
      keyword: "an",
      verb_preposition: "an",
      word_type: 1,
      article: 0
    },
    {
      word: "werden",
      meaning: "not important",
      example: "Unter null Grad wird Eis zu Wasser.",
      keyword: "zu",
      verb_preposition: "zu",
      word_type: 1,
      article: 0
    },
    {
      word: "wissen",
      meaning: "not important",
      example: "Ich weiß nichts von neuen Computern für unser Team.",
      keyword: "von",
      verb_preposition: "von",
      word_type: 1,
      article: 0
    },
    {
      word: "sich wundern",
      meaning: "not important",
      example: "Viele Deutsche wundern sich über die plötzlich so hohen Stromkosten.",
      keyword: "über",
      verb_preposition: "über",
      word_type: 1,
      article: 0
    },
    {
      word: "zuschauen",
      meaning: "not important",
      example: "Kann ich dir bei der Reparatur zuschauen?",
      keyword: "bei",
      verb_preposition: "bei",
      word_type: 1,
      article: 0
    },
    {
      word: "zusehen",
      meaning: "not important",
      example: "Willst du mir beim Kochen zusehen?",
      keyword: "bei",
      verb_preposition: "bei",
      word_type: 1,
      article: 0
    },
    {
      word: "zweifeln",
      meaning: "not important",
      example: "John zweifelt daran, dass sein Sohn die Wahrheit gesagt hat.",
      keyword: "an",
      verb_preposition: "an",
      word_type: 1,
      article: 0
    }
  ]

  verben_mit_praepositionen.each do |word_obj|
    begin
      Word.create! word_obj
    rescue => ex
      puts ex
      puts word_obj.inspect
    end
  end
end
