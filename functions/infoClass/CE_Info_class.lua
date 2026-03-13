
--Class info for Combat Engine by Neoraxer



function CE_COLOR(ID)

local text = "|cff80ff00"..CE_toName(ID).."|r"
return text

end


--Set color wind
local function Viento()

local text = ""
if GetLanguage() == "ES" then
	text = "|cffb0e0e6viento|r"
else 
	text = "|cffb0e0e6wind|r"
end 
return text

end 

--Set color fire
local function Fuego()

local text = ""
if GetLanguage() == "ES" then
	text = "|cfff86f29fuego|r"
else 
	text = "|cfff86f29fire|r"
end 
return text

end 


--Set color earth
local function Tierra()

local text = ""
if GetLanguage() == "ES" then
	text = "|cff977254tierra|r"
else 
	text = "|cff977254earth|r"
end 
return text

end 

--Set color darkness
local function Dark()

local text = ""
if GetLanguage() == "ES" then
	text = "|cff7777ecoscuro|r"
else 
	text = "|cff7777ecdark|r"
end 
return text

end 

--Set color light
local function Luz()

local text = ""
if GetLanguage() == "ES" then
	text = "|cfffaf3d4luz|r"
else 
	text = "|cfffaf3d4light|r"
end 
return text

end 

--Set color Posion
local function Veneno()

local text = ""
if GetLanguage() == "ES" then
	text = "|cff66cc1aveneno|r"
else 
	text = "|cff66cc1apoison|r"
end 
return text

end 

--Set color Water
local function Agua()

local text = ""
if GetLanguage() == "ES" then
	text = "|cff009fdfagua|r"
else 
	text = "|cff009fdfwater|r"
end 
return text

end 

-- Formatear texto título info
function CE_INFO_TEXT(VAR)

local main, sec = UnitClassToken("player")

    -- Español
if GetLanguage() == "ES" then
	-- ROGUE
	if main == "THIEF" then
            -- ROGUE/WARLOCK
            if sec == "HARPSYN" then
                VAR:SetText("Entrenado en las artes oscuras, el pícaro-brujo es un dps físico formidable como ninguno, con la posibilidad de empuñar una katana o dos dagas, su poder radica en la capacidad de generar gran daño "..Dark().." a sus oponentes");
            elseif sec == "RANGER" then
                VAR:SetText("Conocido como el asechador del bosque, el pícaro-explorador es capaz de invocar sombras que atraviesan a sus enemigos con poderosas flechas");
			elseif sec == "WARRIOR" then
				VAR:SetText("El asesino de las montañas, el pícaro-guerrero es un maestro en hachas a una mano, empuña un hacha en cada mano y crea poderosas areas de "..Veneno().." puro")
			elseif sec == "MAGE" then
				VAR:SetText("Un maestro de las cuchillas del infierno. El pícaro-mago domina el poder elemental del "..Fuego().." en cada uno de sus certeros ataques, fuertes áreas de daño elemental")
			elseif sec == "AUGUR" then
				VAR:SetText("La voluntad de los dioses te inundan de valor. Dps físico con inmunidad al miedo, daño elemental de "..Agua().." y "..Veneno()..", áreas continuas.")
			elseif sec == "KNIGHT" then
				VAR:SetText("Duro y fuerte como roca. El pícaro-Caballero ha entrenado su cuerpo para resistir terribles ataques, tanque cuerpo a cuerpo de áreas de daño "..Luz()..".")
			elseif sec == "WARDEN" then
				VAR:SetText("La naturaleza se ha fusionado con tu energía física, permitiendote usar poderosos ataques de daño elemental de "..Tierra()..".")
			elseif sec == "DRUID" then
				VAR:SetText("La madre tierra ha bendecido tus armas con la habilidad de crear poderosas y continuas áreas de daño "..Tierra()..", el pícaro-druida es un Dps físico de daño elemental")
			elseif sec == "PSYRON" then
				VAR:SetText("Tu cuerpo remodelado aumenta tu daño y ayuda a tus compañeros, invoca mecanismos y lanza poderosas bombas para destruir el campo de batalla, esparce "..Veneno().." en sus enemigos, especialista en martillos")
			elseif sec == "BARD" then
				VAR:SetText("La música fluye por tus armas, dándote el poder del "..Viento()..", poderosas ráfagas en áreas continuas, y ataques llenos de energía elemental.")
			else
				VAR:SetText("Sobreviviendo entre las calles de la ciudad, el pícaro es un bandido sigiloso y con gran talento. Bares, apuestas y peleas callejeras han sido su mundo desde pequeño")
			end
	-- SCOUT
	elseif main == "RANGER" then
            -- RANGER/MAGE
            if sec == "WARRIOR" then
                VAR:SetText("El explorador-guerrero ha potenciado su velocidad de ataque enormemente a costa de su velocidad de movimiento, flechas con elevado ataque físico");
            elseif sec == "THIEF" then
				VAR:SetText("Cada flecha asesta en los puntos débiles de tu oponente, ataques cubiertos de "..Veneno().." aniquilaran dolorosamente a tu enemigo.")
            elseif sec == "MAGE" then
				VAR:SetText("Versátil como nínguno, con la posibilidad de hacer daño físico o mágico, áreas y flechas llenas de poder elemental de "..Fuego()..".")			
            elseif sec == "AUGUR" then
				VAR:SetText("Support innato, dedicado a su equipo, cada "..CE_COLOR(492649).." curará a tus compañeros, además de otorgar daño y velocidad a tus aliados.")
            elseif sec == "KNIGHT" then
				VAR:SetText("Support curativo de alta resistencia, curación elevada basada en el daño de tu arma, capacidad de reducir consumo de tus aliados en un 100% y brindar ataque y velocidad en cada "..CE_COLOR(493318)..".")
            elseif sec == "WARDEN" then
				VAR:SetText("Dps físico de alto calibre, el explorador-alcaide ha recibido la "..CE_COLOR(494038)..", cada ataque hace daño extra de tipo elemental de "..Tierra()..".")
            elseif sec == "DRUID" then
				VAR:SetText("Cada flecha de este Dps es letal, |cff80ff00"..CE_toName(1490277).."|cffffffff instantáneo, combos mortales, buffos potenciadores de ataque y daño físico. Ahora tu "..CE_COLOR(499583).." golpea en areas constantes, causando gran cantidad de daño "..Veneno().." a tus enemigos.")
            elseif sec == "HARPSYN" then
				VAR:SetText("Dps mágico, el explorador-brujo se ha dejado dominar por el arte oscura, cada flecha está impregnada de "..Veneno().." maldito.")
            elseif sec == "PSYRON" then
				VAR:SetText("Dps físico de media distancia, ha optado por usar pistolas, fuertes áreas y daño físico, |cff80ff00"..CE_toName(1490784).."|cffffffff ya no consume puntos de vida.")
            elseif sec == "BARD" then
				VAR:SetText("Tu valor motiva a tus compañeros, |cff80ff00"..CE_toName(1491224).."|cffffffff reviste a todos tus aliados de inmunidad al miedo, support que daño y velocidad de ataque.")
			else
				VAR:SetText("Los bosques han sido su tutor y mentor, cada flecha tiene parte del alma de los árboles. Ágil y con gran presición a distancia, el explorador es un arquero inigualable")
			end
			
	-- Druid
	elseif main == "DRUID" then
            if sec == "WARRIOR" then
                VAR:SetText("Este druida ha abandonado la paz de su alma convirtiéndose en un bravo combatiente cuerpo a cuerpo, con la capacidad de equipar equipo de cota de malla, cuero y hachas a dos manos, crea poderosos ataques de daño elemental de "..Tierra()..".");
            elseif sec == "THIEF" then
				VAR:SetText("La oscuridad ha invadido tu magia, creando venenos corrosivos y daño elemental "..Dark()..", druida con daño mágico y velocidad de invocación aumentados.")
            elseif sec == "MAGE" then
				VAR:SetText("Equilibrio entre daño y curación, el poder del mago te ha ayudado a dominar el poder elemental del "..Fuego().." y la "..Tierra()..".")			
            elseif sec == "AUGUR" then
				VAR:SetText("El poder del sacerdote te permite aumentar tu sabiduría con |cff80ff00"..CE_toName(1490652).."|cffffffff, además tu |cff80ff00"..CE_toName(1490757).."|cffffffff produce |cff80ff00"..CE_toName(1490657).."|cffffffff y se esparece alrededor de tu objetivo.")
            elseif sec == "KNIGHT" then
				VAR:SetText("El entrenamiento del caballero te permite resistir, aumentando tambien tu daño "..Luz()..", pero también tu agro")
            elseif sec == "WARDEN" then
				VAR:SetText("El poder de la naturaleza fluye dentro de ti, tu |cff80ff00"..CE_toName(499884).."|cffffffff ahora proteje a todos tus aliados, poder curativo aumentado.")
            elseif sec == "RANGER" then
				VAR:SetText("Healer a distancia con poder de la naturaleza aumentado y gran curación grupal, ahora tu |cff80ff00"..CE_toName(499954).."|cffffffff curará a múltiples aliados a tu alrededor.")
            elseif sec == "HARPSYN" then
				VAR:SetText("El poder oscuro de los demonios te ha consumido, transformándote en un poderoso dps mágico mediante la |cff80ff00"..CE_toName(1490628).."|cffffffff.")
            elseif sec == "PSYRON" then
				VAR:SetText("Implanta poderosos mecanismos en el campo de batalla, que además de curar a tus aliados fortalecerán sus habilidades de batalla")
            elseif sec == "BARD" then
				VAR:SetText("Tus melodías disminuyen el costo de las habilidades de tus aliados, modifica el terreno invocando pantanos que ralentizarán a tus enemigos.")
			else
				VAR:SetText("Esta raza élfica ha habitado el corazón del bosque desde antes de la humanidad, tu capacidad curativa excede los límites de la compresión, y esto es por que la madre tierra te ha bendecido")
			end
			
	-- PRIEST
	elseif main == "AUGUR" then
            if sec == "WARRIOR" then
                VAR:SetText("Has sido entrenado en el arte del combate cuerpo a cuerpo, |cff80ff00"..CE_toName(491600).."|cffffffff te llena de fuerza, aumentando tu poder de ataque físico. Ahora tus ataques físicos causan daño "..Luz()..", y puedes llevar equipo de cota de malla y cuero.")
            elseif sec == "THIEF" then
				VAR:SetText("El sacerdote-pícaro se ha hecho con hechizos prohibidos de las bibliotecas paganas, invoca una |cff80ff00"..CE_toName(493269).."|cffffffff que aumentará el poder de ataque mágico de tus aliados.")
            elseif sec == "MAGE" then
				VAR:SetText("El poder del mago te vuelve más fuerte, |cff80ff00"..CE_toName(491365).."|cffffffff aumentará tu daño mágico y velocidad de invocación con cada hechizo de curación directa.")			
            elseif sec == "DRUID" then
				VAR:SetText("El poder de la naturaleza se entrelaza con tus conocimientos divinos, Las |cff80ff00"..CE_toName(1490460).."|cffffffff elevaran drásticamente tus curas y tu velocidad de invocación.")
            elseif sec == "KNIGHT" then
				VAR:SetText("Sientes tu cuerpo más resistente, tu |cff80ff00"..CE_toName(499967).."|cffffffff cura a quien la porte, y el poder divino del caballero te permite invocar un |cff80ff00"..CE_toName(493271).."|cffffffff, la que aumentará los atributos de todos tus aliados a su alrededor.")
            elseif sec == "WARDEN" then
				VAR:SetText("La naturaleza abraza tus conocimientos divinos, regalándote el don de invocar un |cff80ff00"..CE_toName(1490473).."|cffffffff que te asistirá en cada batalla.")
            elseif sec == "RANGER" then
				VAR:SetText("La precisión del arquero te permite curar a distancia, además tu |cff80ff00"..CE_toName(499979).."|cffffffff ahora cura a todos tus aliados en un radio de 180. El espíritu del agua te ha favorecido y ahora con su |cff80ff00"..CE_toName(491323).."|cffffffff conviertes parte de tu daño a distancia en daño mágico.")
            elseif sec == "HARPSYN" then
				VAR:SetText("Las habilidades cósmicas del brujo te han enseñado a dominar las dimensiones, |cff80ff00"..CE_toName(498628).."|cffffffff y |cff80ff00"..CE_toName(498773).."|cffffffff te permitirán transportar a tus amigos hasta tu posición.")
            elseif sec == "PSYRON" then
				VAR:SetText("Has aprendido los mecanismos de batalla, tus invocaciones aumentan la velocidad de ataque y de invocación de tus amigos, gracias a tu |cff80ff00"..CE_toName(498610).."|cffffffff ahora ganas ira en cada casteo.")
            elseif sec == "BARD" then
				VAR:SetText("¡Eres el alma de la fiesta! Gracias a tu |cff80ff00"..CE_toName(1491254).."|cffffffff tus compañeros se moveran más rápido que un rayo, y tu |cff80ff00"..CE_toName(1491255).."|cffffffff reduce el coste de todos los hechizos de tus aliados.")
			else
				VAR:SetText("El sacerdote ha encontrado su camino en las enseñanzas divinas, obtienes |cff80ff00"..CE_toName(490280).."|cffffffff, habilidad celestial para reanimar a cualquier aliado abatido")
			end
			
-- MAGE
	elseif main == "MAGE" then
            if sec == "WARRIOR" then
                VAR:SetText("El entrenamiento del guerrero te hace más hábil en batalla, aumentando tu maná y puntos de vida máximos gracias a tu "..CE_COLOR(491562)..". También has aprendido a lanzar hechizos en movimiento mediante el "..CE_COLOR(499588)..".")
            elseif sec == "THIEF" then
				VAR:SetText("Tu magia está contaminada con la oscuridad, el gran control sobre las sombras te ayudan a inflingir daño "..Dark()..", además la "..CE_COLOR(493030).." te cubre, reduciendo así el daño de área recibido.")
            elseif sec == "AUGUR" then
				VAR:SetText("Los conocimientos sobre la mágia y artes curativas te llenan de "..CE_COLOR(491587)..", tu daño mágico aumenta significativamente, enseñandote el "..CE_COLOR(499607).." que aumenta tu daño elemental de "..Fuego().." y "..Viento()..".")		
            elseif sec == "DRUID" then
				VAR:SetText("Eres uno con la naturaleza, vuestra "..CE_COLOR(499607).." sobre las cosas incrementa tu daño mágico y tu vida máxima, has dominado el daño elememtal de "..Tierra()..".")
            elseif sec == "KNIGHT" then
				VAR:SetText("Gran daño de área, el caballero te inunda de poder elemental de "..Luz()..". Ráfagas de "..CE_COLOR(499613).." caen del cielo, detonando sobre tus enemigos.")
            elseif sec == "WARDEN" then
				VAR:SetText("Los secretos de los elfos te han sido revelados, tu control elemental sobre la "..Tierra().." es mejor que nunca. "..CE_COLOR(1490308).." incrementa ahora tu poder de ataque y daño mágico.")
            elseif sec == "RANGER" then
				VAR:SetText("Tus flechas están impregnadas de daño elemental, "..CE_COLOR(499597).." las ha cubierto de magia. Además este gran control natural te permite materialar los elementos invocando un poderoso "..CE_COLOR(491577).." para que te ayude en la batalla.")
            elseif sec == "HARPSYN" then
				VAR:SetText("Has descubirto la "..CE_COLOR(499814)..", tus victimas se sienten más débiles. Además tu poder mágico elevado te permite que tus habilidades hagan doble daño, combinando daño de "..Fuego().." y de "..Viento()..".")
            elseif sec == "PSYRON" then
				VAR:SetText("El dominio del campeador te ha vuelto experto en ataques de daño elememtal de "..Viento()..", además tu control preciso de la ira y el rayo te permiten crear un "..CE_COLOR(499811).." para protegerte")
            elseif sec == "BARD" then
				VAR:SetText("Sientes un "..CE_COLOR(1491247).." que te quema por dentro, tu daño elemental de "..Veneno().." es más poderoso que nunca.")
			else
				VAR:SetText("El mago ha descubierto la sabiduría elemental, su control sobre la materia lo hace insuperable en las artes mágicas.")
			end
-- WARRIOR
	elseif main == "WARRIOR" then
            if sec == "MAGE" then
                VAR:SetText("Dps mágico de cuerpo a cuerpo, tu espada a dos manos lleva poderosos ataques que causan daño elemental de "..Fuego().." y "..Viento()..".")
            elseif sec == "THIEF" then
				VAR:SetText("Ágil como ninguno, tu habilidad "..CE_COLOR(491463).." te permite moverte junto con tus reflejos, especialidad en portar un arma en cada mano.")
            elseif sec == "AUGUR" then
				VAR:SetText("Los sentimientos del sacerdote se riegan por tu espada haciendo que tu "..CE_COLOR(491466).." aumente la vida de todos tus compañeros de equipo.")		
            elseif sec == "DRUID" then
				VAR:SetText("El poder de la naturaleza cubre tu arma llenándola de espinas, "..CE_COLOR(494034).." hace crecer rosas por tu espada aumentando así su daño físico.")
            elseif sec == "KNIGHT" then
				VAR:SetText("Te has vuelto más resistente, el poder del caballero te permite llevar equipo de chapa y usar ataques de escudo.")
            elseif sec == "WARDEN" then
				VAR:SetText("Tu poder físico ha aumentado conciderablemente, las habilidades del alcaide te han permitido aprender poderosas áreas.")
            elseif sec == "RANGER" then
				VAR:SetText("Tu destreza con el arco te hace posible inflingir daño tanto cuerpo a cuerpo como a larga distancia, poder físico puro y eficaz.")
            elseif sec == "HARPSYN" then
				VAR:SetText("El brujo en tu interior te permite controlar la maldad de los corazones, creando grandes tornados de daño "..Dark()..".")
            elseif sec == "PSYRON" then
				VAR:SetText("Te ecuentras entre la locura de la vida y la muerte, tu poder desmesurado te resta vida constantemente, pero tus habiliades te curan.")
            elseif sec == "BARD" then
				VAR:SetText("Ira y foco en constante equilibrio, tu "..CE_COLOR(1491541).." golpea 3 veces y causa gran cantidad de daño "..Veneno().." a tus oponentes.")
			else
				VAR:SetText("El guerrero es un combatiente formidable, hábil en el combate cuerpo a cuerpo y capaz de enfrentar cualquier desafío con fuerza y valentía.")
			end
			
-- WARDEN
	elseif main == "WARDEN" then
            if sec == "MAGE" then
                VAR:SetText("El conocimiento del mago te llena de "..CE_COLOR(498227)..", sientes que tú, y tu "..CE_COLOR(102324).." son ahora mucho más fuertes.")
            elseif sec == "THIEF" then
				VAR:SetText("La tenacidad del pícaro te concede la habilidad "..CE_COLOR(494614).." que te permite equipar un arma secundaria, y a su vez aumente tu daño en armas de una mano")
            elseif sec == "AUGUR" then
				VAR:SetText("La habilidad del sacerdote dentro de ti es incontenible, "..CE_COLOR(1490678).." te permite resucitar a tus aliados, tu "..CE_COLOR(1490670).." aumenta drásticamente tu daño mágico y sabiduría, y tus conocimientos de alcaide hacen que seas capaz de invocar un "..CE_COLOR(139347).." que te ayudará a curar a tus aliados.")		
            elseif sec == "DRUID" then
				VAR:SetText("Tus habilidades ahora hacen daño mágico elemental de "..Tierra().." x int. Pero necesitan ser casteadas, además tu "..CE_COLOR(1490265).." ahora cura a tus aliados cercanos.")
            elseif sec == "KNIGHT" then
				VAR:SetText("Adquieres la habilidad de usar chapa, y ahora tu "..CE_COLOR(1490861).." te cura a ti y a vuestra mascota.")
            elseif sec == "WARRIOR" then
				VAR:SetText("Tu poder es implacable, cuando tomas el mando como "..CE_COLOR(499900).." tu ataque y daño físico se dispara, tus subordinados confían en ti, "..CE_COLOR(494611).." te vincula a un compañero aumentando la defensa de ambos.")
            elseif sec == "RANGER" then
				VAR:SetText("Gracias a las habilidades del arquero, puedes ahora invocar al "..CE_COLOR(102803)..", que hiere gravemente a tus adversarios con poderosas flechas.")
            elseif sec == "HARPSYN" then
				VAR:SetText("El brujo hace relucir lo más tóxico de la naturaleza, daño elemental de "..Veneno().." en cada ataque. Puedes invocar una "..CE_COLOR(139348).." que peleará vorazmente a tu lado.")
            elseif sec == "PSYRON" then
				VAR:SetText("EL toque mecánico del campeador te permite invocar un "..CE_COLOR(139346)..", el que te ayudará a reunir a tus enemigos. Además, gracias a tu "..CE_COLOR(1490523).." ahora puedes llevar equipo de chapa.")
            elseif sec == "BARD" then
				VAR:SetText("El bardo te brinda gran control elemental, tus habilidades ahora ocasionan daño elemental de "..Fuego().." y "..Viento()..".")
			else
				VAR:SetText("El alcaide es un poderoso guerrero élfico, entrenado en el combate físico y con la capacidad de invocar aliados naturales que lo ayuden en la batalla")
			end
			
-- KNIGHT
	elseif main == "KNIGHT" then
            if sec == "MAGE" then
                VAR:SetText("Tu "..CE_COLOR(491628)..", agrea constantemente en área produciendo daño "..Luz().." a tu alrededor, tanque especialista en reunir patrullas enemigas.")
            elseif sec == "THIEF" then
				VAR:SetText("La agilidad del pícaro te vuelve más veloz mejorando tus posibilidades de esquivar, al mismo tiempo "..CE_COLOR(493047).." te curará cada vez que lo hagas. LLevar dos armas aumentará el agro generado en cada golpe, gracias a tu "..CE_COLOR(491621)..".")
            elseif sec == "AUGUR" then
				VAR:SetText("La bendición del sacedote te otorga, "..CE_COLOR(499913).." permitiéndote resucitar a un compañero, aún durante la batalla.")		
            elseif sec == "DRUID" then
				VAR:SetText("La conección con el druida te ha acercado a la madre tierra, reciendo así "..CE_COLOR(1490509).." que aumenta tu resistencia y tu curación recibida, y de esta forma obtienes también "..CE_COLOR(1490516).." que aumenta la curación recibida de todo tu grupo.")
            elseif sec == "RANGER" then
				VAR:SetText("Tu destreza con el arco te permite agrear a tus enemigos a grandes distancias y con gran efectividad. "..CE_COLOR(499924).." ahora aumenta tu daño "..Luz().." y tu curación recibida.")
            elseif sec == "WARRIOR" then
				VAR:SetText("La fuerza del guerrero te vuelve más destructivo, tus habilidades están haciendo más daño, obtienes "..CE_COLOR(490018).." que obligará a tus enemigos a centrarce en ti, y te pondrá primero en agro.")
            elseif sec == "HARPSYN" then
				VAR:SetText("De pronto te sientes más dañino, "..CE_COLOR(1490523).." tranforma tu resistencia y destreza en fuerza, y ahora tus ataques llevan dentro daño "..Luz().." y "..Dark()..".")
            elseif sec == "PSYRON" then
				VAR:SetText("El pasado herrero del campeador te ha concedido un "..CE_COLOR(1490481).." que aumenta el daño de todos los martillos. "..CE_COLOR(1490807).." ahora aumenta la defensa de todos tus aliados cercanos.")
            elseif sec == "BARD" then
				VAR:SetText("La locura músical del bardo te mantiene en un concierto caótico, otorgándonte efectos según la nota musical que estés entonando.")
            elseif sec == "WARDEN" then
				VAR:SetText("Tu conección con la naturaleza ha provocado que tus ataques ahora causen daño "..Tierra().." y ya no generen tanto agro, además tus habilidades defensivas ahora suben tu fuerza, y no tu defensa.")
			else
				VAR:SetText("El caballero es el tanque por excelencia, protegiendo a su equipo con su imponente armadura y habilidades defensivas, desafía a sus enemigos cara a cara en el campo de batalla.")
			end	
-- WARLOCK
	elseif main == "HARPSYN" then
            if sec == "MAGE" then
                VAR:SetText("Support por excelencia, pero también gran control de daño elemental de "..Fuego()..". Tu habilidad "..CE_COLOR(1491874).." causa que tu "..CE_COLOR(498701).." afecte a toda la raid.")
            elseif sec == "THIEF" then
				VAR:SetText("La astucia del picaro está entrelazada con tu magia, tu daño "..Dark().." se ha visto potenciado por las sombras y ahora "..CE_COLOR(499867).." también inflige daño "..Dark()..".")
            elseif sec == "AUGUR" then
				VAR:SetText("A pesar de tu pasado oscuro, los dioses te han bendecido con habilidades curativas potenciadas para asistir a tus compañeros.")		
            elseif sec == "DRUID" then
				VAR:SetText("El "..CE_COLOR(1490618).." que habita en ti logra convertir toda tu inteligencia en sabiduría, dándote el poder de sanar a tus aliados con gran habilidad. También ahora tu "..CE_COLOR(1490960).." afecta a todos los enemigos alrededor de tu objetivo")
            elseif sec == "RANGER" then
				VAR:SetText("La perspicacia del explorador te da una visión aguda del entorno, aumentando tu velocidad de invocación y regeración de foco. "..CE_COLOR(1490943).." ahora aumenta tu daño "..Dark().." y tu |cfff86f29inteligencia|r.")
            elseif sec == "WARRIOR" then
				VAR:SetText("La fuerza del guerrero fluye por tu cuerpo. "..CE_COLOR(498632).." ahora inflige daño "..Dark()..", y tu habilidad "..CE_COLOR(499871).." recupera ira, foco y Psi.")
            elseif sec == "KNIGHT" then
				VAR:SetText("El "..CE_COLOR(1490591).." invade vuestro ser, aumentando tu agro generado, mientras tu habilidad de "..CE_COLOR(1490592).." ha potenciado enormemente la "..CE_COLOR(1490945).." convirtiéndote en todo un tanque.")
            elseif sec == "PSYRON" then
				VAR:SetText("La "..CE_COLOR(498650).." te quema por dentro aumentando tu daño mágico subitamente. Tu "..CE_COLOR(497958).." está afectando a todos los miembros de la raid.")
            elseif sec == "BARD" then
				VAR:SetText("Las notas musicales fluyen por tu magia, concediéndote la habilidad de usar hechizos del bardo sin instrumentos. Además tu "..CE_COLOR(1491509).." ahora inflige daño "..Dark()..".")
            elseif sec == "WARDEN" then
				VAR:SetText("El "..CE_COLOR(1490603).." que has recibido te permite ahora llevar una espada a dos manos, y tu "..CE_COLOR(1490602).." aumenta aún más tu daño "..Dark()..".")
			else
				VAR:SetText("El brujo es un maestro en el arte de la magia oscura y el combate. Dominando el fuego y las maldiciones, arrasa con sus enemigos en el campo de batalla.")
			end	
-- Camper
	elseif main == "PSYRON" then
            if sec == "MAGE" then
                VAR:SetText("El conocimiento del mago aumenta tu daño físico y defensa elemental.")
            elseif sec == "THIEF" then
				VAR:SetText("Tu martillo a una mano se ha llenado de daño elemental "..Dark()..", las habiliades del pícaro te hacen más rápido y más destructivo.")
            elseif sec == "AUGUR" then
				VAR:SetText("Te sientes en conexión con lo espiritual, recargar energía y mana ahora es más fácil gracias a tu "..CE_COLOR(498716)..". Tus armas bendecidas estan llenas de daño "..Luz().." y está relación divina te permite usar "..CE_COLOR(499838).." que revivirá a todos tus alidos caidos que estén cerca de ti.")		
            elseif sec == "DRUID" then
				VAR:SetText("Support innato, "..CE_COLOR(1490575).." animará a tus aliados, curándolos y aumentado su ataque físico y mágico. También gracias a tu "..CE_COLOR(1490571).." te sacrificas a ti mismo para aumentar el daño causado por tus compañeros.")
            elseif sec == "RANGER" then
				VAR:SetText("Has desarrollado la capacidad de equipar pistolas, tus poderosos disparos cercanos están causando estragos en el campo de batalla.")
            elseif sec == "WARRIOR" then
				VAR:SetText("La "..CE_COLOR(498580).." dentro de ti te permite manejar el doble de ira y ahora, gracias a la bravura del guerrero, puedes llevar equipo de chapa.")
            elseif sec == "KNIGHT" then
				VAR:SetText("Te has convertido en un muro impenetrable, estas rebosando de defensa. Gracias a la resistencia del caballero ahora puedes llevar equipo de chapa.")
            elseif sec == "HARPSYN" then
				VAR:SetText("El poder elemental del brujo se entrelaza con tu cuerpo remodelado otorgándonte poderosas habiliades de daño "..Dark()..".")
            elseif sec == "BARD" then
				VAR:SetText("Tu mecanismo está resonando armoniosamente gracias a tu "..CE_COLOR(1491299).." que mantiene en equilibrio tu foco e ira. Tus habilidades han cambiado para causar daño mágico elememtal de "..Viento()..".")
            elseif sec == "WARDEN" then
				VAR:SetText("El equilibrio entre defensa y poder. El Campeador-Alcaide es un sólido oponente en batalla, poderosos golpes llenos de daño elemental de "..Tierra()..".")
			else
				VAR:SetText("El forjar de las armas y el continuo martillar en lo profundo de las montañas, han hecho de esta raza un fuerte y resistente adversario.")
			end	
-- BARDO
	elseif main == "BARD" then
            if sec == "MAGE" then
                VAR:SetText("Tus ataques se han cargado de energía elemental de "..Fuego()..". Tu gran daño mágico provoca que tu "..CE_COLOR(1491340).." se refleje hasta en dos enemigos cercanos.")
            elseif sec == "THIEF" then
				VAR:SetText("Te has vuelto más letal y despiadado, tu música transmite un sentimiento agonizante brindándote poderoso daño "..Dark()..". Además, ahora puedes llevar equipo de cuero y daga.")
            elseif sec == "AUGUR" then
				VAR:SetText("Te sientes con mas vitalidad, "..CE_COLOR(1491148).." aumenta tu vida máxima. Tus melodías están motivando a tus compañeros, aumentando su poder de ataque físico y mágico. Has desarrollado la capacidad de reducir el daño de áera recibido, tanto tuyo, como el de tus compañeros. Ahora tambipen eres capaz de ayudar al tanke a provocar a sus enemigos cercanos.")		
            elseif sec == "DRUID" then
				VAR:SetText("La "..CE_COLOR(1491178).." te otorgado la capacidad de equipar un bastón, la "..CE_COLOR(1491180).." recorre tu cuerpo haciendo que tu daño elemetal de "..Tierra().." esté potenciado. ")
            elseif sec == "RANGER" then
				VAR:SetText("El poder físico te inunda, puedes llevar equipo de cuero y usar poderosos ataques de larga distancia. "..CE_COLOR(491292).." ahora te curará continuamente en lugar de restarte puntos vida.")
            elseif sec == "WARRIOR" then
				VAR:SetText("El guerrero dentro de ti ha despertado, llenándote de "..CE_COLOR(1491108)..". Obtienes la capacidad de llevar un arma secundaria y equipo de cota de malla.")
            elseif sec == "KNIGHT" then
				VAR:SetText("La "..CE_COLOR(1491158).." te permite llevar equipo de chapa, además de aumentar significativamente tu defensa física. Tu agro está aumentado y ya no pueden interrumpirte mientras tocas tus recitales.")
            elseif sec == "HARPSYN" then
				VAR:SetText("Te has convertido en un "..CE_COLOR(1491189)..", cada alma cosechada aumenta tu daño físico y mágico. Tus habiliades están causando gran cantidad de daño mágico "..Dark().." y ahora puedes equipar un talismán.")
            elseif sec == "PSYRON" then
				VAR:SetText("Obtienes la capacidad de llevar una armadura de cuero. Tus ataques estan llenos de daño de "..Veneno()..", y también aprendes a incinerar a tus enemigos cercanos con poderosas llamas de daño "..Fuego()..".")
            elseif sec == "WARDEN" then
				VAR:SetText("Las notas psicodélicas que has oído te han causado "..CE_COLOR(1491176)..", esto aumenta tu velocidad de ataque y daño físico de forma permanenete. Ya no necesitas instrumentos para tocar tu música. Puedes llevar equipo de cota, cuero y hacha a dos manos. Esta hacha lleva su daño aumentado, y tu "..CE_COLOR(1491383).." se ha encantado para causar estragos en tus enemigos.")
			else
				VAR:SetText("El bardo viaja con su música alegrando a todos a su paso, hábil en batalla, ha logrado controlar las notas de su música para causar daños en sus oponentes.")
			end	
				
			
	-- Otra clase principal
	else
	VAR:SetText("Sin información")
	end

    -- Otro idioma (inglés u otro)
else
	-- ROGUE
	if main == "THIEF" then
            -- ROGUE/WARLOCK
            if sec == "HARPSYN" then
                VAR:SetText("Trained in the dark arts, the rogue-warlock is a formidable physical DPS like none other, with the ability to wield a katana or two daggers, their power lies in the ability to deal great "..Dark().." damage to their opponents.");
			elseif sec == "RANGER" then
				VAR:SetText("Known as the forest stalker, the rogue-scout is capable of summoning shadows that will pierce through their enemies with powerful arrows.")
			elseif sec == "WARRIOR" then
				VAR:SetText("The mountain slayer, the rogue-warrior is a master in one-handed axes, wielding an axe in each hand and creating powerful areas of letal "..Veneno()..".")
			elseif sec == "MAGE" then
				VAR:SetText("A master of hell's blades, the rogue-mage dominates the "..Fuego().." elemental power, in each of their precise attacks, strong areas of elemental damage")
			elseif sec == "AUGUR" then
				VAR:SetText("The will of the gods floods you with courage. Physical DPS with fear immunity, "..Agua().." and "..Veneno().." elemental damage, continuous areas.")
			elseif sec == "KNIGHT" then
				VAR:SetText("Tough and strong as rock. The rogue-Knight has trained their body to withstand terrible attacks, melee tank with areas of "..Luz().." damage.")
			elseif sec == "WARDEN" then
				VAR:SetText("Nature has fused with your physical energy, allowing you to use powerful "..Tierra().." elemental damage attacks.")
			elseif sec == "DRUID" then
				VAR:SetText("Mother Earth has blessed your weapons with the ability to create powerful and continuous "..Tierra().." elemental damage areas. The rogue-druid is a physical DPS with elemental damage.")
			elseif sec == "PSYRON" then
				VAR:SetText("Your remodeled body increases your damage and aids your companions, summons mechanisms and launches powerful bombs to destroy the battlefield, spreads "..Veneno().." on its enemies, specialist in hammers.")
			elseif sec == "BARD" then
				VAR:SetText("Music flows through your weapons, giving you the power of the "..Viento()..", powerful bursts in continuous areas, and attacks full of elemental "..Viento().." energy.")
			else
				VAR:SetText("Surviving among the city streets, the rogue is a stealthy and highly skilled bandit. Bars, gambling, and street fights have been his world since childhood.")
			end	
	--SCOUT
	elseif main == "RANGER" then
			if sec == "WARRIOR" then
				VAR:SetText("The scout-warrior has greatly enhanced their attack speed at the cost of their movement speed, arrows with high physical damage.");
			elseif sec == "THIEF" then
				VAR:SetText("Each arrow strikes at your opponent's weak points, "..Veneno().."-covered attacks will painfully annihilate your enemy.")
			elseif sec == "MAGE" then
				VAR:SetText("Versatile like no other, with the ability to deal physical or magical damage, areas and arrows full of "..Fuego().." elemental power.")         
			elseif sec == "AUGUR" then
				VAR:SetText("Innate support, dedicated to their team, each |cff80ff00"..CE_toName(492649).."|cffffffff will heal your companions, as well as granting damage and speed to your allies.")
			elseif sec == "KNIGHT" then
				VAR:SetText("High-resistance healing support, elevated healing based on your weapon's damage, ability to reduce your allies' consumption by 100% and provide attack and speed in each |cff80ff00"..CE_toName(493318))
			elseif sec == "WARDEN" then
				VAR:SetText("High-caliber physical DPS, the ranger-warden has received the |cff80ff00"..CE_toName(494038).."|cffffffff, each attack deals extra "..Tierra().." elemental damage.")
			elseif sec == "DRUID" then
				VAR:SetText("Each arrow of this DPS is lethal, |cff80ff00"..CE_toName(1490277).."|cffffffff instant, deadly combos, attack and physical damage enhancing buffs. Now your "..CE_COLOR(499583).." hits in constant areas, causing a great amount of "..Veneno().." damage to your enemies.")
			elseif sec == "HARPSYN" then
				VAR:SetText("Magic DPS, the ranger-warlock has let themselves be dominated by dark arts, each arrow is imbued with cursed "..Veneno()..".")
			elseif sec == "PSYRON" then
				VAR:SetText("Mid-range physical DPS, has chosen to use guns, strong areas and physical damage, |cff80ff00"..CE_toName(1490784).."|cffffffff no longer consumes health points.")
			elseif sec == "BARD" then
				VAR:SetText("Your courage motivates your companions, |cff80ff00"..CE_toName(1491224).."|cffffffff grants all your allies immunity to fear, support that gives damage and attack speed.")
			
			else
				VAR:SetText("The forests have been his tutor and mentor, each arrow carries a piece of the trees' souls. Agile and highly precise from a distance, the scout is an unmatched archer.")
			end
	--DRUID
		elseif main == "DRUID" then
			if sec == "WARRIOR" then
				VAR:SetText("This druid has forsaken the peace of their soul, becoming a fierce melee combatant, capable of equipping chainmail, leather, and two-handed axes, creating powerful earth elemental damage attacks.")
			elseif sec == "THIEF" then
				VAR:SetText("Darkness has invaded your magic, creating corrosive "..Veneno().."s and "..Dark().." elemental damage, druid with increased magical damage and casting speed.")
			elseif sec == "MAGE" then
				VAR:SetText("Balancing between damage and healing, the power of the mage has aided you in mastering the elemental power of "..Fuego().." and "..Tierra()..".")
			elseif sec == "AUGUR" then
				VAR:SetText("The power of the priest allows you to enhance your wisdom with |cff80ff00"..CE_toName(1490652).."|cffffffff, also your |cff80ff00"..CE_toName(1490757).."|cffffffff produces |cff80ff00"..CE_toName(1490657).."|cffffffff and spreads around your target.")
			elseif sec == "KNIGHT" then
				VAR:SetText("Knight training enables you to endure, also increasing your "..Luz().." damage, but also your aggro.")
			elseif sec == "WARDEN" then
				VAR:SetText("The power of nature flows within you, your |cff80ff00"..CE_toName(499884).."|cffffffff now protects all your allies, increased healing power.")
			elseif sec == "RANGER" then
				VAR:SetText("Ranged healer with increased nature power and great group healing, now your |cff80ff00"..CE_toName(499954).."|cffffffff will heal multiple allies around you.")
			elseif sec == "HARPSYN" then
				VAR:SetText("The dark power of demons has consumed you, transforming you into a powerful magical DPS through the |cff80ff00"..CE_toName(1490628))
			elseif sec == "PSYRON" then
				VAR:SetText("Implant powerful mechanisms on the battlefield, which not only heal your allies but also strengthen their battle abilities.")
			elseif sec == "BARD" then
				VAR:SetText("Your melodies reduce the cost of your allies' skills, modify the terrain by summoning swamps that will slow down your enemies.")
			else
				VAR:SetText("This elven race has inhabited the heart of the forest since before humanity; your healing ability exceeds the bounds of comprehension, and this is because Mother Earth has blessed you.")
			end
	-- PRIEST
		elseif main == "AUGUR" then
			if sec == "WARRIOR" then
				VAR:SetText("You have been trained in the art of close combat, |cff80ff00"..CE_toName(491600).."|cffffffff fills you with strength, increasing your physical attack power. Now your physical attacks deal "..Luz().." damage, and you can wear chainmail and leather gear.")
			elseif sec == "THIEF" then
				VAR:SetText("The priest-rogue has acquired forbidden spells from pagan libraries, summoning a |cff80ff00"..CE_toName(493269).."|cffffffff that will increase the magical attack power of your allies.")
			elseif sec == "MAGE" then
				VAR:SetText("The power of the mage makes you stronger, |cff80ff00"..CE_toName(491365).."|cffffffff will increase your magical damage and casting speed with each direct healing spell.")
			elseif sec == "DRUID" then
				VAR:SetText("The power of nature intertwines with your divine knowledge, The |cff80ff00"..CE_toName(1490460).."|cffffffff will drastically enhance your heals and your casting speed.")
			elseif sec == "KNIGHT" then
				VAR:SetText("You feel your body more resilient, your |cff80ff00"..CE_toName(499967).."|cffffffff heals whoever carries it, and the divine power of the knight allows you to summon a |cff80ff00"..CE_toName(493271).."|cffffffff, which will increase the attributes of all your allies around you.")
			elseif sec == "WARDEN" then
				VAR:SetText("Nature embraces your divine knowledge, granting you the gift of summoning a |cff80ff00"..CE_toName(1490473).."|cffffffff that will assist you in every battle.")
			elseif sec == "RANGER" then
				VAR:SetText("The archer's precision allows you to heal from a distance, and your |cff80ff00"..CE_toName(499979).."|cffffffff now heals all your allies within a radius of 180. The water spirit has favored you and now with its |cff80ff00"..CE_toName(491323).."|cffffffff you convert some of your ranged damage into magical damage.")
			elseif sec == "HARPSYN" then
				VAR:SetText("The cosmic abilities of the warlock have taught you to master dimensions, |cff80ff00"..CE_toName(498628).."|cffffffff and |cff80ff00"..CE_toName(498773).."|cffffffff will allow you to transport your friends to your position.")
			elseif sec == "PSYRON" then
				VAR:SetText("You have learned the mechanisms of battle, your summons increase the attack and casting speed of your friends, thanks to your |cff80ff00"..CE_toName(498610).."|cffffffff now you gain rage with each cast.")
			elseif sec == "BARD" then
				VAR:SetText("You are the soul of the party! Thanks to your |cff80ff00"..CE_toName(1491254).."|cffffffff your companions will move faster than lightning, and your |cff80ff00"..CE_toName(1491255).."|cffffffff reduces the cost of all your allies spells.")
			else
				VAR:SetText("The priest has found his way in divine teachings, you gain |cff80ff00"..CE_toName(490280).."|cffffffff, celestial ability to revive any fallen ally.")
			end			
	--MAGE
		elseif main == "MAGE" then
			if sec == "WARRIOR" then
				VAR:SetText("Warrior training makes you more skilled in battle, increasing your mana and maximum health thanks to your "..CE_COLOR(491562)..". You've also learned to cast spells while moving using "..CE_COLOR(499588)..".")
			elseif sec == "THIEF" then
				VAR:SetText("Your magic is tainted with darkness, great control over shadows helps you inflict "..Dark().." damage, additionally "..CE_COLOR(493030).." covers you, thus reducing area damage received.")
			elseif sec == "AUGUR" then
				VAR:SetText("Knowledge of magic and healing arts fills you with "..CE_COLOR(491587)..", your magical damage increases significantly, teaching you the "..CE_COLOR(499607).." that enhances your elemental damage of "..Fuego().." and "..Viento()..".")      
			elseif sec == "DRUID" then
				VAR:SetText("You are one with nature, your "..CE_COLOR(499607).." over things increases your magical damage and maximum life, you have mastered the "..Tierra().." elememtal damage.")
			elseif sec == "KNIGHT" then
				VAR:SetText("Great area damage, the knight floods you with elemental power of "..Luz()..". "..CE_COLOR(499613).." bursts fall from the sky, detonating upon your enemies.")
			elseif sec == "WARDEN" then
				VAR:SetText("The secrets of the elves have been revealed to you, your elemental control over the "..Tierra().." is better than ever. "..CE_COLOR(1490308).." now increases your attack power and magical damage.")
			elseif sec == "RANGER" then
				VAR:SetText("Your arrows are imbued with elemental damage, "..CE_COLOR(499597).." has covered them with magic. Additionally, this great natural control allows you to materialize the elements by summoning a powerful "..CE_COLOR(491577).." to assist you in battle.")
			elseif sec == "HARPSYN" then
				VAR:SetText("You have discovered the "..CE_COLOR(499814)..", your victims feel weaker. Additionally, your elevated magical power allows your abilities to deal double damage, combining "..Fuego().." and "..Viento().." damage.")
			elseif sec == "PSYRON" then
				VAR:SetText("The mastery of the champion has made you an expert in "..Viento().." elemental damage, additionally your precise control of wrath and lightning allows you to create a "..CE_COLOR(499811).." to protect yourself.")
			elseif sec == "BARD" then
				VAR:SetText("You feel a "..CE_COLOR(1491247).." burning inside you, your "..Veneno().." elemental damage is more powerful than ever.")
			else
				VAR:SetText("The mage has discovered elemental wisdom, his control over matter makes him unbeatable in magical arts.")
			end
		-- WARRIOR
		elseif main == "WARRIOR" then
			if sec == "MAGE" then
				VAR:SetText("Melee magical DPS, your two-handed sword carries powerful attacks that deal elemental damage of "..Fuego().." and "..Viento()..".")
			elseif sec == "THIEF" then
				VAR:SetText("Agile like no other, your skill "..CE_COLOR(491463).." allows you to move along with your reflexes, specializing in wielding a weapon in each hand.")
			elseif sec == "AUGUR" then
				VAR:SetText("The priest's feelings flow through your sword, causing your "..CE_COLOR(491466).." to increase the life of all your teammates.")
			elseif sec == "DRUID" then
				VAR:SetText("The power of nature covers your weapon, filling it with thorns, "..CE_COLOR(494034).." makes roses grow from your sword, thus increasing its physical damage.")
			elseif sec == "KNIGHT" then
				VAR:SetText("You've become more resilient, the power of the knight allows you to wear plate armor and use shield attacks.")
			elseif sec == "WARDEN" then
				VAR:SetText("Your physical power has increased considerably, the warden's skills have allowed you to learn powerful areas.")
			elseif sec == "RANGER" then
				VAR:SetText("Your skill with the bow enables you to inflict damage both in melee and at long range, pure and effective physical power.")
			elseif sec == "HARPSYN" then
				VAR:SetText("The warlock within you allows you to control the evil in people's hearts, creating great tornadoes of " ..Dark().." damage.")
			elseif sec == "PSYRON" then
				VAR:SetText("You exist between the madness of life and death, your immense power constantly drains life, but your abilities heal you.")
			elseif sec == "BARD" then
				VAR:SetText("Wrath and focus in constant balance, your "..CE_COLOR(1491541).." strikes 3 times and deals a great amount of "..Veneno().." damage to your opponents.")
			else
				VAR:SetText("The warrior is a formidable fighter, skilled in melee combat and capable of facing any challenge with strength and courage.")
			end		
		-- WARDEN
		elseif main == "WARDEN" then
			if sec == "MAGE" then
				VAR:SetText("The wizard's knowledge fills you with "..CE_COLOR(498227).." , you feel that you, and your "..CE_COLOR(102324).." are now much stronger.")
			elseif sec == "THIEF" then
				VAR:SetText("The rogue's tenacity grants you the ability "..CE_COLOR(494614).." allowing you to equip a secondary weapon, while also increasing your damage with one-handed weapons.")
			elseif sec == "AUGUR" then
				VAR:SetText("The priest's skill within you is unstoppable, "..CE_COLOR(1490678).." allows you to resurrect your allies, your "..CE_COLOR(1490670).." dramatically increases your magical damage and wisdom, and your warden knowledge enables you to summon a "..CE_COLOR(139347).." that will help heal your allies.")
			elseif sec == "DRUID" then
				VAR:SetText("Your abilities now deal "..Tierra().." elemental magical damage x int. But they need to be casted, also your "..CE_COLOR(1490265).." now heals your nearby allies.")
			elseif sec == "KNIGHT" then
				VAR:SetText("You gain the ability to use plate, and now your "..CE_COLOR(1490861).." heals you and your pet.")
			elseif sec == "WARRIOR" then
				VAR:SetText("Your power is relentless, when you take command as "..CE_COLOR(499900).." your attack and physical damage skyrockets, your subordinates trust in you, "..CE_COLOR(494611).." binds you to a partner increasing both defenses.")
			elseif sec == "RANGER" then
				VAR:SetText("Thanks to the archer's skills, you can now summon the "..CE_COLOR(102803).." which severely injures your adversaries with powerful arrows.")
			elseif sec == "HARPSYN" then
				VAR:SetText("The warlock brings out the most toxic of nature,"..Veneno().." elemental damage in every attack. You can summon a "..CE_COLOR(139348).." that will fight voraciously by your side.")
			elseif sec == "PSYRON" then
				VAR:SetText("The champion's mechanical touch allows you to summon a "..CE_COLOR(139346)..", which will help you gather your enemies. Also, thanks to your "..CE_COLOR(1490523).." now you can wear plate armor.")
			elseif sec == "BARD" then
				VAR:SetText("The bard grants you great elemental control, your abilities now cause "..Fuego().." and "..Viento().." elemental damage.")
			else
				VAR:SetText("The warden is a powerful elven warrior, trained in physical combat and with the ability to summon natural allies to aid in battle.")
			end
		-- KNIGHT
		elseif main == "KNIGHT" then
			if sec == "MAGE" then
				VAR:SetText("Your "..CE_COLOR(491628).." continually wreaks havoc in the area, dealing "..Luz().." damage around you, specializing in drawing enemy patrols.")
			elseif sec == "THIEF" then
				VAR:SetText("The rogue's agility makes you swifter, enhancing your dodging abilities, while "..CE_COLOR(493047).." heals you each time. Dual-wielding increases aggro generated with each strike, thanks to your "..CE_COLOR(491621).." proficiency.")
			elseif sec == "AUGUR" then
				VAR:SetText("The priest's blessing grants you "..CE_COLOR(499913).." allowing you to resurrect a teammate, even mid-battle.")       
			elseif sec == "DRUID" then
				VAR:SetText("Your connection with the druid has attuned you to mother earth, granting "..CE_COLOR(1490509).." increasing your resilience and healing received, along with "..CE_COLOR(1490516).." enhancing group-wide healing received.")
			elseif sec == "RANGER" then
				VAR:SetText("Your archery prowess enables you to draw enemies from great distances with deadly precision. "..CE_COLOR(499924).." now boosts both your "..Luz().." damage and healing received.")
			elseif sec == "WARRIOR" then
				VAR:SetText("The warrior's strength makes you more destructive, your abilities dealing increased damage, gaining "..CE_COLOR(490018).." forcing enemies to focus on you, putting you first in aggro.")
			elseif sec == "HARPSYN" then
				VAR:SetText("Suddenly, you feel more lethal, "..CE_COLOR(1490523).." channels your resilience and agility into strength, infusing your attacks with "..Luz().." and "..Dark().." damage.")
			elseif sec == "PSYRON" then
				VAR:SetText("The champion blacksmith's legacy grants you a "..CE_COLOR(1490481).." boosting damage for all hammers. "..CE_COLOR(1490807).." now enhances defense for all nearby allies.")
			elseif sec == "BARD" then
				VAR:SetText("The bard's musical madness keeps you in a chaotic concert, bestowing effects based on the musical note you're intoning.")
			elseif sec == "WARDEN" then
				VAR:SetText("Your connection with nature has caused your attacks to now deal "..Tierra().." damage and generate less aggro, furthermore, your defensive abilities now increase your strength, not your defense.")
			else
				VAR:SetText("The Knight is the quintessential tank, shielding their team with imposing armor and defensive skills, daring enemies to face them head-on in the battlefield.")
			end 
		-- WARLOCK
	elseif main == "HARPSYN" then
            if sec == "MAGE" then
                VAR:SetText("Support par excellence, but also great elemental damage control from "..Fuego()..". Your ability "..CE_COLOR(1491874).." causes your "..CE_COLOR(498701).." to affect the entire raid.")
            elseif sec == "THIEF" then
				VAR:SetText("The rogue's cunning is intertwined with your magic, your "..Dark().." damage has been enhanced by the shadows and now "..CE_COLOR(499867).." also inflicts "..Dark().." damage.")
            elseif sec == "AUGUR" then
				VAR:SetText("Despite your dark past, the gods have blessed you with enhanced healing abilities to assist your companions.")		
            elseif sec == "DRUID" then
				VAR:SetText("The "..CE_COLOR(1490618).." within you manages to turn all your intelligence into wisdom, giving you the power to heal your allies with great skill. Also now your "..CE_COLOR(1490960).." affects all enemies around your target.")
            elseif sec == "RANGER" then
				VAR:SetText("The ranger's insight gives you a sharp view of the surroundings, increasing your summoning speed and focus regeneration. "..CE_COLOR(1490943).." now increases your "..Dark().." damage and your |cfff86f29intelligence|r.")
            elseif sec == "WARRIOR" then
				VAR:SetText("The strength of the warrior flows through your body. "..CE_COLOR(498632).." now inflicts "..Dark().." damage, and your ability "..CE_COLOR(499871).." restores rage, focus, and Psi.")
            elseif sec == "KNIGHT" then
				VAR:SetText("The "..CE_COLOR(1490591).." invades your being, increasing your generated threat, while your "..CE_COLOR(1490592).." ability has greatly enhanced the "..CE_COLOR(1490945).." turning you into a full-fledged tank.")
            elseif sec == "PSYRON" then
				VAR:SetText("The "..CE_COLOR(498650).." burns within you suddenly increasing your magical damage. Your "..CE_COLOR(497958).." is affecting all members of the raid.")
            elseif sec == "BARD" then
				VAR:SetText("Musical notes flow through your magic, granting you the ability to use bard spells without instruments. Also, your "..CE_COLOR(1491509).." now inflicts "..Dark().." damage.")
            elseif sec == "WARDEN" then
				VAR:SetText("The "..CE_COLOR(1490603).." you have received now allows you to wield a two-handed sword, and your "..CE_COLOR(1490602).." further increases your "..Dark().." damage.")
			else
				VAR:SetText("The warlock is a master in the art of dark magic and combat. Mastering fire and curses, it ravages its enemies on the battlefield.")
			end	
		-- Camper
	elseif main == "PSYRON" then
			if sec == "MAGE" then
				VAR:SetText("The mage's knowledge enhances your physical damage and elemental defense.")
			elseif sec == "THIEF" then
				VAR:SetText("Your one-handed hammer is infused with "..Dark().." elemental damage, the rogue's abilities make you faster and more destructive.")
			elseif sec == "AUGUR" then
				VAR:SetText("You feel a connection to the spiritual, recharging energy and mana is now easier thanks to your "..CE_COLOR(498716)..". Your blessed weapons are imbued with "..Luz().." damage, and this divine connection allows you to use "..CE_COLOR(499838).." which will revive all fallen allies near you.")
			elseif sec == "DRUID" then
				VAR:SetText("Innate support, "..CE_COLOR(1490575).." will encourage your allies, healing them and increasing their physical and magical attack. Also, thanks to your "..CE_COLOR(1490571).." you sacrifice yourself to increase the damage caused by your companions.")
			elseif sec == "RANGER" then
				VAR:SetText("You have developed the ability to equip pistols, your powerful close-range shots are wreaking havoc on the battlefield.")
			elseif sec == "WARRIOR" then
				VAR:SetText("The "..CE_COLOR(498580).." within you allows you to handle double the rage and now, thanks to the warrior's bravery, you can wear plate equipment.")
			elseif sec == "KNIGHT" then
				VAR:SetText("You have become an impenetrable wall, overflowing with defense. Thanks to the knight's resilience, you can now wear plate equipment.")
			elseif sec == "HARPSYN" then
				VAR:SetText("The elemental power of the warlock intertwines with your remodeled body, granting you powerful "..Dark().." damage skills.")
			elseif sec == "BARD" then
				VAR:SetText("Your mechanism is resonating harmoniously thanks to your "..CE_COLOR(1491299).." that maintains balance between your focus and rage. Your abilities have changed to cause "..Viento().." elemental magic damage.")
			elseif sec == "WARDEN" then
				VAR:SetText("The balance between defense and power. The Champion-Warden is a solid opponent in battle, powerful blows full of "..Tierra().." elemental damage.")
			else
				VAR:SetText("Forging weapons and the continuous hammering deep in the mountains have made this race a strong and resilient adversary.")
			end

		-- BARD
	elseif main == "BARD" then
			if sec == "MAGE" then
				VAR:SetText("Your attacks have been charged with "..Fuego().." elemental energy. Your high magical damage causes your "..CE_COLOR(1491340).." to reflect onto up to two nearby enemies.")
			elseif sec == "THIEF" then
				VAR:SetText("You have become more lethal and ruthless, your music conveys a haunting feeling granting you powerful "..Dark().." damage. Additionally, you can now wear leather equipment and wield a dagger.")
			elseif sec == "AUGUR" then
				VAR:SetText("You feel more vitality, "..CE_COLOR(1491148).." increases your maximum health. Your melodies are motivating your companions, increasing their physical and magical attack power. You have developed the ability to reduce area damage received, both yours and that of your companions. You are now also able to help the tank provoke nearby enemies.")
			elseif sec == "DRUID" then
				VAR:SetText("The "..CE_COLOR(1491178).." has granted you the ability to equip a staff, the "..CE_COLOR(1491180).." flows through your body causing your "..Tierra().." elemental damage to be enhanced.")
			elseif sec == "RANGER" then
				VAR:SetText("Physical power floods you, you can wear leather equipment and use powerful long-range attacks. "..CE_COLOR(491292).." will now continuously heal you instead of deducting health points.")
			elseif sec == "WARRIOR" then
				VAR:SetText("The warrior within you has awakened, filling you with "..CE_COLOR(1491108)..". You gain the ability to wield a secondary weapon and wear chainmail equipment.")
			elseif sec == "KNIGHT" then
				VAR:SetText("The "..CE_COLOR(1491158).." allows you to wear plate equipment, as well as significantly increasing your physical defense. Your aggro is increased and they can no longer interrupt you while you play your recitals.")
			elseif sec == "HARPSYN" then
				VAR:SetText("You have become a "..CE_COLOR(1491189)..", each harvested soul increases your physical and magical damage. Your abilities are causing a great deal of "..Dark().." magical damage, and now you can equip a talisman.")
			elseif sec == "PSYRON" then
				VAR:SetText("You gain the ability to wear leather armor. Your attacks are filled with "..Veneno().." damage, and you also learn to incinerate nearby enemies with powerful flames of "..Fuego().." damage.")
			elseif sec == "WARDEN" then
				VAR:SetText("The psychedelic notes you've heard have caused "..CE_COLOR(1491176)..", this increases your attack speed and physical damage permanently. You no longer need instruments to play your music. You can wear chainmail, leather, and wield a two-handed axe. This axe has its damage increased, and your "..CE_COLOR(1491383).." has been enchanted to wreak havoc on your enemies.")
			else
				VAR:SetText("The bard travels with his music, bringing joy to all in his path, skilled in battle, he has managed to control the notes of his music to cause damage to his opponents.")
			end


	-- Otra clase principal
	else
	VAR:SetText("No information")
	end
end

end

--ELEMENTS ICON
function CE_UPDATE_ELEMENTAL_DAMAGE()
	
	local Elemental, Tierra, Agua, Fuego, Viento, Luz, Oscuridad, Veneno = GetPlayerElementalDamage();	
	if not _G.CE_ELEMENT or _G.CE_ELEMENT == nil then
		_G.CE_ELEMENT = {}
	end
	
	_G.CE_ELEMENT.Elemental = Elemental
	_G.CE_ELEMENT.Tierra = Tierra
	_G.CE_ELEMENT.Agua = Agua
	_G.CE_ELEMENT.Fuego = Fuego
	_G.CE_ELEMENT.Viento = Viento
	_G.CE_ELEMENT.Luz = Luz
	_G.CE_ELEMENT.Oscuridad = Oscuridad
	_G.CE_ELEMENT.Veneno = Veneno


end


function CE_SET_ELEMENT()

	local MAIN_CLASS, SEC_CLASS = UnitClassToken("player")

	--dark
        if ((MAIN_CLASS == "THIEF") and (SEC_CLASS == "HARPSYN"))  or ((MAIN_CLASS == "WARRIOR") and (SEC_CLASS == "HARPSYN"))  or ((MAIN_CLASS == "MAGE") and (SEC_CLASS == "THIEF")) or ((MAIN_CLASS == "DRUID") and (SEC_CLASS == "THIEF")) or ((MAIN_CLASS == "HARPSYN") and (SEC_CLASS ~=  "MAGE")) or ((MAIN_CLASS == "PSYRON") and (SEC_CLASS ==  "THIEF")) or ((MAIN_CLASS == "BARD") and (SEC_CLASS == "THIEF")) or ((MAIN_CLASS == "BARD") and (SEC_CLASS == "HARPSYN")) then
			CE_ART_DARK:Enable()
			CE_ART_DARK:Show()
			CE_ART_POISON:Disable()
			CE_ART_POISON:Hide()
			CE_ART_FIRE:Disable()
			CE_ART_FIRE:Hide()
			CE_ART_WIND:Disable()
			CE_ART_WIND:Hide()
			CE_ART_EARTH:Hide()
			CE_ART_EARTH:Disable()
			CE_ART_WATER:Hide()
			CE_ART_WATER:Disable()
			CE_ART_LIGHT:Hide()
			CE_ART_LIGHT:Disable()
	--veneno
		elseif ((MAIN_CLASS == "THIEF") and (SEC_CLASS == "WARRIOR")) or ((MAIN_CLASS == "WARRIOR") and (SEC_CLASS == "BARD")) or ((MAIN_CLASS == "RANGER") and (SEC_CLASS == "THIEF"))  or ((MAIN_CLASS == "RANGER") and (SEC_CLASS == "HARPSYN")) or ((MAIN_CLASS == "THIEF") and (SEC_CLASS == "PSYRON")) or ((MAIN_CLASS == "MAGE") and (SEC_CLASS == "BARD")) or ((MAIN_CLASS == "WARDEN") and (SEC_CLASS == "HARPSYN"))  or ((MAIN_CLASS == "RANGER") and (SEC_CLASS == "DRUID")) then
			CE_ART_POISON:Enable()
			CE_ART_POISON:Show()
			CE_ART_POISON:ClearAllAnchors()
			CE_ART_POISON:SetAnchor("TOPRIGHT", "TOPRIGHT", "CE_FRAME_INFO_CLASS", -24, 65)
			CE_ART_DARK:Disable()
			CE_ART_DARK:Hide()
			CE_ART_FIRE:Disable()
			CE_ART_FIRE:Hide()
			CE_ART_WIND:Disable()
			CE_ART_WIND:Hide()
			CE_ART_EARTH:Hide()
			CE_ART_EARTH:Disable()
			CE_ART_WATER:Hide()
			CE_ART_WATER:Disable()
			CE_ART_LIGHT:Hide()
			CE_ART_LIGHT:Disable()
	--viento y fuego
		elseif ((MAIN_CLASS == "WARRIOR") and (SEC_CLASS == "MAGE")) or ((MAIN_CLASS == "MAGE") and (SEC_CLASS == "WARRIOR")) or ((MAIN_CLASS == "MAGE") and (SEC_CLASS == "RANGER")) or ((MAIN_CLASS == "MAGE") and (SEC_CLASS == "HARPSYN")) or ((MAIN_CLASS == "MAGE") and (SEC_CLASS == "PSYRON")) or ((MAIN_CLASS == "WARDEN") and (SEC_CLASS == "BARD")) then
			CE_ART_POISON:Disable()
			CE_ART_POISON:Hide()
			CE_ART_DARK:Disable()
			CE_ART_DARK:Hide()
			CE_ART_FIRE:Enable()
			CE_ART_FIRE:Show()
			CE_ART_WIND:Enable()
			CE_ART_WIND:Show()
			CE_ART_WIND:ClearAllAnchors()
			CE_ART_WIND:SetAnchor("TOPRIGHT", "TOPRIGHT", "CE_FRAME_INFO_CLASS", -84, 65)
			CE_ART_EARTH:Hide()
			CE_ART_EARTH:Disable()
			CE_ART_WATER:Hide()
			CE_ART_WATER:Disable()
			CE_ART_LIGHT:Hide()
			CE_ART_LIGHT:Disable()
	--veneno y fuego
		elseif (MAIN_CLASS == "BARD") and (SEC_CLASS == "PSYRON") then
			CE_ART_POISON:Enable()
			CE_ART_POISON:Show()
			CE_ART_POISON:ClearAllAnchors()
			CE_ART_POISON:SetAnchor("TOPRIGHT", "TOPRIGHT", "CE_FRAME_INFO_CLASS", -84, 65)
			CE_ART_DARK:Disable()
			CE_ART_DARK:Hide()
			CE_ART_FIRE:Enable()
			CE_ART_FIRE:Show()
			CE_ART_WIND:Disable()
			CE_ART_WIND:Hide()
			CE_ART_EARTH:Hide()
			CE_ART_EARTH:Disable()
			CE_ART_WATER:Hide()
			CE_ART_WATER:Disable()
			CE_ART_LIGHT:Hide()
			CE_ART_LIGHT:Disable()
	--fuego
		elseif ((MAIN_CLASS == "RANGER") and (SEC_CLASS == "MAGE")) or ((MAIN_CLASS == "THIEF") and (SEC_CLASS == "MAGE")) or ((MAIN_CLASS == "HARPSYN") and (SEC_CLASS == "MAGE")) or ((MAIN_CLASS == "BARD") and (SEC_CLASS == "MAGE")) then
			CE_ART_POISON:Disable()
			CE_ART_POISON:Hide()
			CE_ART_DARK:Disable()
			CE_ART_DARK:Hide()
			CE_ART_FIRE:Enable()
			CE_ART_FIRE:Show()
			CE_ART_WIND:Disable()
			CE_ART_WIND:Hide()
			CE_ART_EARTH:Hide()
			CE_ART_EARTH:Disable()
			CE_ART_WATER:Hide()
			CE_ART_WATER:Disable()
			CE_ART_LIGHT:Hide()
			CE_ART_LIGHT:Disable()
	--tierra
		elseif ((MAIN_CLASS == "RANGER") and (SEC_CLASS == "WARDEN")) or ((MAIN_CLASS == "THIEF") and (SEC_CLASS == "WARDEN")) or ((MAIN_CLASS == "THIEF") and (SEC_CLASS == "DRUID")) or ((MAIN_CLASS == "MAGE") and (SEC_CLASS == "WARDEN")) or ((MAIN_CLASS == "MAGE") and (SEC_CLASS == "DRUID")) or ((MAIN_CLASS == "WARDEN") and (SEC_CLASS == "DRUID")) or ((MAIN_CLASS == "DRUID") and (SEC_CLASS == "WARRIOR")) or ((MAIN_CLASS == "KNIGHT") and (SEC_CLASS == "WARDEN")) or ((MAIN_CLASS == "PSYRON") and (SEC_CLASS == "WARDEN")) or ((MAIN_CLASS == "BARD") and (SEC_CLASS == "DRUID")) then
			CE_ART_POISON:Disable()
			CE_ART_POISON:Hide()
			CE_ART_DARK:Disable()
			CE_ART_DARK:Hide()
			CE_ART_FIRE:Disable()
			CE_ART_FIRE:Hide()
			CE_ART_WIND:Disable()
			CE_ART_WIND:Hide()
			CE_ART_EARTH:Show()
			CE_ART_EARTH:Enable()
			CE_ART_EARTH:ClearAllAnchors()
			CE_ART_EARTH:SetAnchor("TOPRIGHT", "TOPRIGHT", "CE_FRAME_INFO_CLASS", -24, 65)
			CE_ART_WATER:Hide()
			CE_ART_WATER:Disable()
			CE_ART_LIGHT:Hide()
			CE_ART_LIGHT:Disable()
	--Agua y veneno
		elseif (MAIN_CLASS == "THIEF") and (SEC_CLASS == "AUGUR") then
			CE_ART_POISON:Enable()
			CE_ART_POISON:Show()
			CE_ART_DARK:Disable()
			CE_ART_DARK:Hide()
			CE_ART_FIRE:Disable()
			CE_ART_FIRE:Hide()
			CE_ART_WIND:Disable()
			CE_ART_WIND:Hide()
			CE_ART_EARTH:Hide()
			CE_ART_EARTH:Disable()
			CE_ART_WATER:Show()
			CE_ART_WATER:Enable()
			CE_ART_LIGHT:Hide()
			CE_ART_LIGHT:Disable()
	--luz
		elseif ((MAIN_CLASS == "THIEF") and (SEC_CLASS == "KNIGHT")) or ((MAIN_CLASS == "MAGE") and (SEC_CLASS == "KNIGHT")) or ((MAIN_CLASS == "DRUID") and (SEC_CLASS == "KNIGHT")) or ((MAIN_CLASS == "KNIGHT") and (SEC_CLASS == "WARRIOR")) or ((MAIN_CLASS == "KNIGHT") and (SEC_CLASS == "RANGER")) or ((MAIN_CLASS == "KNIGHT") and (SEC_CLASS == "THIEF")) or ((MAIN_CLASS == "KNIGHT") and (SEC_CLASS == "AUGUR")) or ((MAIN_CLASS == "KNIGHT") and (SEC_CLASS == "MAGE")) or ((MAIN_CLASS == "KNIGHT") and (SEC_CLASS == "PSYRON")) or ((MAIN_CLASS == "KNIGHT") and (SEC_CLASS == "BARD")) or ((MAIN_CLASS == "KNIGHT") and (SEC_CLASS == "")) or ((MAIN_CLASS == "PSYRON") and (SEC_CLASS == "KNIGHT")) or ((MAIN_CLASS == "PSYRON") and (SEC_CLASS == "AUGUR")) or ((MAIN_CLASS == "AUGUR") and (SEC_CLASS == "WARRIOR")) then
			CE_ART_POISON:Disable()
			CE_ART_POISON:Hide()
			CE_ART_DARK:Disable()
			CE_ART_DARK:Hide()
			CE_ART_FIRE:Disable()
			CE_ART_FIRE:Hide()
			CE_ART_WIND:Disable()
			CE_ART_WIND:Hide()
			CE_ART_EARTH:Hide()
			CE_ART_EARTH:Disable()
			CE_ART_WATER:Hide()
			CE_ART_WATER:Disable()
			CE_ART_LIGHT:Show()
			CE_ART_LIGHT:Enable()
			CE_ART_LIGHT:ClearAllAnchors()
			CE_ART_LIGHT:SetAnchor("TOPRIGHT", "TOPRIGHT", "CE_FRAME_INFO_CLASS", -24, 65)
			
	--viento
		elseif ((MAIN_CLASS == "THIEF") and (SEC_CLASS == "BARD")) or ((MAIN_CLASS == "PSYRON") and (SEC_CLASS == "BARD")) then
					
			CE_ART_POISON:Disable()
			CE_ART_POISON:Hide()
			CE_ART_DARK:Disable()
			CE_ART_DARK:Hide()
			CE_ART_FIRE:Disable()
			CE_ART_FIRE:Hide()
			CE_ART_WIND:Enable()
			CE_ART_WIND:Show()
			CE_ART_WIND:ClearAllAnchors()
			CE_ART_WIND:SetAnchor("TOPRIGHT", "TOPRIGHT", "CE_FRAME_INFO_CLASS", -24, 65)
			CE_ART_EARTH:Hide()
			CE_ART_EARTH:Disable()
			CE_ART_WATER:Hide()
			CE_ART_WATER:Disable()
			CE_ART_LIGHT:Hide()
			CE_ART_LIGHT:Disable()
	--viento y agua
		elseif (MAIN_CLASS == "MAGE") and (SEC_CLASS == "AUGUR")then
			CE_ART_POISON:Disable()
			CE_ART_POISON:Hide()
			CE_ART_DARK:Disable()
			CE_ART_DARK:Hide()
			CE_ART_FIRE:Enable()
			CE_ART_FIRE:Show()
			CE_ART_WIND:Enable()
			CE_ART_WIND:Show()
			CE_ART_WIND:ClearAllAnchors()
			CE_ART_WIND:SetAnchor("TOPRIGHT", "TOPRIGHT", "CE_FRAME_INFO_CLASS", -24, 65)
			CE_ART_EARTH:Hide()
			CE_ART_EARTH:Disable()
			CE_ART_WATER:Show()
			CE_ART_WATER:Enable()
			CE_ART_LIGHT:Hide()
			CE_ART_LIGHT:Disable()
	--Fuego y Tierra
		elseif (MAIN_CLASS == "DRUID") and (SEC_CLASS == "MAGE")then
			CE_ART_POISON:Disable()
			CE_ART_POISON:Hide()
			CE_ART_DARK:Disable()
			CE_ART_DARK:Hide()
			CE_ART_FIRE:Enable()
			CE_ART_FIRE:Show()
			CE_ART_WIND:Disable()
			CE_ART_WIND:Hide()
			CE_ART_EARTH:Show()
			CE_ART_EARTH:Enable()
			CE_ART_EARTH:ClearAllAnchors()
			CE_ART_EARTH:SetAnchor("TOPRIGHT", "TOPRIGHT", "CE_FRAME_INFO_CLASS", -84, 65)
			CE_ART_WATER:Hide()
			CE_ART_WATER:Disable()
			CE_ART_LIGHT:Hide()
			CE_ART_LIGHT:Disable()
	--luz y Oscuridad
		elseif (MAIN_CLASS == "KNIGHT") and (SEC_CLASS == "HARPSYN") then
			CE_ART_POISON:Disable()
			CE_ART_POISON:Hide()
			CE_ART_DARK:Enable()
			CE_ART_DARK:Show()
			CE_ART_FIRE:Disable()
			CE_ART_FIRE:Hide()
			CE_ART_WIND:Disable()
			CE_ART_WIND:Hide()
			CE_ART_EARTH:Hide()
			CE_ART_EARTH:Disable()
			CE_ART_WATER:Hide()
			CE_ART_WATER:Disable()
			CE_ART_LIGHT:Show()
			CE_ART_LIGHT:Enable()
			CE_ART_LIGHT:ClearAllAnchors()
			CE_ART_LIGHT:SetAnchor("TOPRIGHT", "TOPRIGHT", "CE_FRAME_INFO_CLASS", -84, 65)
	--luz y Tierra
		elseif (MAIN_CLASS == "KNIGHT") and (SEC_CLASS == "DRUID") then
			CE_ART_POISON:Disable()
			CE_ART_POISON:Hide()
			CE_ART_DARK:Disable()
			CE_ART_DARK:Hide()
			CE_ART_FIRE:Disable()
			CE_ART_FIRE:Hide()
			CE_ART_WIND:Disable()
			CE_ART_WIND:Hide()
			CE_ART_EARTH:Show()
			CE_ART_EARTH:Enable()
			CE_ART_WATER:Hide()
			CE_ART_WATER:Disable()
			CE_ART_LIGHT:Show()
			CE_ART_LIGHT:Enable()
			CE_ART_LIGHT:ClearAllAnchors()
			CE_ART_LIGHT:SetAnchor("TOPRIGHT", "TOPRIGHT", "CE_FRAME_INFO_CLASS", -84, 65)
		else
			CE_ART_POISON:Disable()
			CE_ART_POISON:Hide()
			CE_ART_DARK:Disable()
			CE_ART_DARK:Hide()
			CE_ART_FIRE:Disable()
			CE_ART_FIRE:Hide()
			CE_ART_WIND:Disable()
			CE_ART_WIND:Hide()
			CE_ART_EARTH:Hide()
			CE_ART_EARTH:Disable()
			CE_ART_WATER:Hide()
			CE_ART_WATER:Disable()
			CE_ART_LIGHT:Hide()
			CE_ART_LIGHT:Disable()
		end


end




--Definir Imagen de la Info
function CE_CHANGE_INFO_IMAGE()

	local MAIN_CLASS, SEC_CLASS = UnitClassToken("player")
	local thief = "Interface\\addons\\CombatEngine\\texture\\ROGUE.tga";
	local ranger = "Interface\\addons\\CombatEngine\\texture\\RANGER.tga";
	local mage = "Interface\\addons\\CombatEngine\\texture\\MAGE.tga";
	local druid = "Interface\\addons\\CombatEngine\\texture\\DRUID.tga";
	local warrior = "Interface\\addons\\CombatEngine\\texture\\WARRIOR.tga";
	local knight = "Interface\\addons\\CombatEngine\\texture\\KNIGHT.tga";
	local augur = "Interface\\addons\\CombatEngine\\texture\\AUGUR.tga";
	local bard = "Interface\\addons\\CombatEngine\\texture\\BARD.tga";
	local warden = "Interface\\addons\\CombatEngine\\texture\\WARDEN.tga";
	local warlock = "Interface\\addons\\CombatEngine\\texture\\WARLOCK.tga";
	local psyron = "Interface\\addons\\CombatEngine\\texture\\PSYRON.tga";
	local undefined = "";

	if MAIN_CLASS == "THIEF" then
		CE_ART_INFO_ROGUE:Show();--1
		CE_ART_INFO_SCOUT:Hide();--2
		CE_ART_INFO_MAGE:Hide();--3
		CE_ART_INFO_DRUID:Hide();--4
		CE_ART_INFO_WARRIOR:Hide();--5
		CE_ART_INFO_KNIGHT:Hide();--6
		CE_ART_INFO_AUGUR:Hide();--7
		CE_ART_INFO_UNDEFINED:Hide();--8
		CE_ART_INFO_BARD:Hide();--9
		CE_ART_INFO_WARDEN:Hide();--10
		CE_ART_INFO_WARLOCK:Hide();--11
		CE_ART_INFO_PSYRON:Hide();--12
		COMBATENGINE_EDIT_LUA_ART:SetFile( thief );

	elseif MAIN_CLASS == "RANGER" then
		CE_ART_INFO_ROGUE:Hide();--1
		CE_ART_INFO_AUGUR:Hide();--2
		CE_ART_INFO_MAGE:Hide();--3
		CE_ART_INFO_SCOUT:Show();--4
		CE_ART_INFO_UNDEFINED:Hide();--5
		CE_ART_INFO_WARRIOR:Hide();--6
		CE_ART_INFO_KNIGHT:Hide();--7
		CE_ART_INFO_DRUID:Hide();--8
		CE_ART_INFO_BARD:Hide();--9
		CE_ART_INFO_WARDEN:Hide();--10
		CE_ART_INFO_WARLOCK:Hide();--11
		CE_ART_INFO_PSYRON:Hide();--12
		COMBATENGINE_EDIT_LUA_ART:SetFile( ranger );

	elseif MAIN_CLASS == "MAGE" then
		CE_ART_INFO_ROGUE:Hide();--1
		CE_ART_INFO_MAGE:Show();--2
		CE_ART_INFO_SCOUT:Hide();--3
		CE_ART_INFO_UNDEFINED:Hide();--4
		CE_ART_INFO_WARRIOR:Hide();--5
		CE_ART_INFO_KNIGHT:Hide();--6
		CE_ART_INFO_DRUID:Hide();--7
		CE_ART_INFO_AUGUR:Hide();--8
		CE_ART_INFO_BARD:Hide();--9
		CE_ART_INFO_WARDEN:Hide();--10
		CE_ART_INFO_WARLOCK:Hide();--11
		CE_ART_INFO_PSYRON:Hide();--12
		COMBATENGINE_EDIT_LUA_ART:SetFile( mage );

	elseif MAIN_CLASS == "DRUID" then
		CE_ART_INFO_ROGUE:Hide();--1
		CE_ART_INFO_AUGUR:Hide();--2
		CE_ART_INFO_MAGE:Hide();--3
		CE_ART_INFO_SCOUT:Hide();--4
		CE_ART_INFO_UNDEFINED:Hide();--5
		CE_ART_INFO_WARRIOR:Hide();--6
		CE_ART_INFO_KNIGHT:Hide();--7
		CE_ART_INFO_DRUID:Show();--8
		CE_ART_INFO_BARD:Hide();--9
		CE_ART_INFO_WARDEN:Hide();--10
		CE_ART_INFO_WARLOCK:Hide();--11
		CE_ART_INFO_PSYRON:Hide();--12
		COMBATENGINE_EDIT_LUA_ART:SetFile( druid );

	elseif MAIN_CLASS == "WARRIOR" then
		CE_ART_INFO_ROGUE:Hide();--1
		CE_ART_INFO_MAGE:Hide();--2
		CE_ART_INFO_AUGUR:Hide();--3
		CE_ART_INFO_SCOUT:Hide();--4
		CE_ART_INFO_UNDEFINED:Hide();--5
		CE_ART_INFO_WARRIOR:Show();--6
		CE_ART_INFO_KNIGHT:Hide();--7
		CE_ART_INFO_DRUID:Hide();--8
		CE_ART_INFO_BARD:Hide();--9
		CE_ART_INFO_WARDEN:Hide();--10
		CE_ART_INFO_WARLOCK:Hide();--11
		CE_ART_INFO_PSYRON:Hide();--12
		COMBATENGINE_EDIT_LUA_ART:SetFile( warrior );

	elseif MAIN_CLASS == "KNIGHT" then
		CE_ART_INFO_ROGUE:Hide();--1
		CE_ART_INFO_MAGE:Hide();--2
		CE_ART_INFO_AUGUR:Hide();--3
		CE_ART_INFO_SCOUT:Hide();--4
		CE_ART_INFO_UNDEFINED:Hide();--5
		CE_ART_INFO_WARRIOR:Hide();--6
		CE_ART_INFO_KNIGHT:Show();--7
		CE_ART_INFO_DRUID:Hide();--8
		CE_ART_INFO_BARD:Hide();--9
		CE_ART_INFO_WARDEN:Hide();--10
		CE_ART_INFO_WARLOCK:Hide();--11
		CE_ART_INFO_PSYRON:Hide();--12
		COMBATENGINE_EDIT_LUA_ART:SetFile( knight );

	elseif MAIN_CLASS == "AUGUR" then
		CE_ART_INFO_ROGUE:Hide();--1
		CE_ART_INFO_MAGE:Hide();--2
		CE_ART_INFO_AUGUR:Show();--3
		CE_ART_INFO_SCOUT:Hide();--4
		CE_ART_INFO_UNDEFINED:Hide();--5
		CE_ART_INFO_WARRIOR:Hide();--6
		CE_ART_INFO_KNIGHT:Hide();--7
		CE_ART_INFO_DRUID:Hide();--8
		CE_ART_INFO_BARD:Hide();--9
		CE_ART_INFO_WARDEN:Hide();--10
		CE_ART_INFO_WARLOCK:Hide();--11
		CE_ART_INFO_PSYRON:Hide();--12
		COMBATENGINE_EDIT_LUA_ART:SetFile( augur );

	elseif MAIN_CLASS == "BARD" then
		CE_ART_INFO_ROGUE:Hide();--1
		CE_ART_INFO_MAGE:Hide();--2
		CE_ART_INFO_AUGUR:Hide();--3
		CE_ART_INFO_SCOUT:Hide();--4
		CE_ART_INFO_UNDEFINED:Hide();--5
		CE_ART_INFO_WARRIOR:Hide();--6
		CE_ART_INFO_KNIGHT:Hide();--7
		CE_ART_INFO_DRUID:Hide();--8
		CE_ART_INFO_BARD:Show();--9
		CE_ART_INFO_WARDEN:Hide();--10
		CE_ART_INFO_WARLOCK:Hide();--11
		CE_ART_INFO_PSYRON:Hide();--12
		COMBATENGINE_EDIT_LUA_ART:SetFile( bard );

	elseif MAIN_CLASS == "WARDEN" then
		CE_ART_INFO_ROGUE:Hide();--1
		CE_ART_INFO_MAGE:Hide();--2
		CE_ART_INFO_AUGUR:Hide();--3
		CE_ART_INFO_SCOUT:Hide();--4
		CE_ART_INFO_UNDEFINED:Hide();--5
		CE_ART_INFO_WARRIOR:Hide();--6
		CE_ART_INFO_KNIGHT:Hide();--7
		CE_ART_INFO_DRUID:Hide();--8
		CE_ART_INFO_BARD:Hide();--9
		CE_ART_INFO_WARDEN:Show();--10
		CE_ART_INFO_WARLOCK:Hide();--11
		CE_ART_INFO_PSYRON:Hide();--12
		COMBATENGINE_EDIT_LUA_ART:SetFile( warden );

	elseif MAIN_CLASS == "HARPSYN" then
		CE_ART_INFO_ROGUE:Hide();--1
		CE_ART_INFO_MAGE:Hide();--2
		CE_ART_INFO_AUGUR:Hide();--3
		CE_ART_INFO_SCOUT:Hide();--4
		CE_ART_INFO_UNDEFINED:Hide();--5
		CE_ART_INFO_WARRIOR:Hide();--6
		CE_ART_INFO_KNIGHT:Hide();--7
		CE_ART_INFO_DRUID:Hide();--8
		CE_ART_INFO_BARD:Hide();--9
		CE_ART_INFO_WARDEN:Hide();--10
		CE_ART_INFO_WARLOCK:Show();--11
		CE_ART_INFO_PSYRON:Hide();--12
		COMBATENGINE_EDIT_LUA_ART:SetFile( warlock );

	elseif MAIN_CLASS == "PSYRON" then
		CE_ART_INFO_ROGUE:Hide();--1
		CE_ART_INFO_MAGE:Hide();--2
		CE_ART_INFO_AUGUR:Hide();--3
		CE_ART_INFO_SCOUT:Hide();--4
		CE_ART_INFO_UNDEFINED:Hide();--5
		CE_ART_INFO_WARRIOR:Hide();--6
		CE_ART_INFO_KNIGHT:Hide();--7
		CE_ART_INFO_DRUID:Hide();--8
		CE_ART_INFO_BARD:Hide();--9
		CE_ART_INFO_WARDEN:Hide();--10
		CE_ART_INFO_WARLOCK:Hide();--11
		CE_ART_INFO_PSYRON:Show();--12
		COMBATENGINE_EDIT_LUA_ART:SetFile( psyron );

	else
		CE_ART_INFO_ROGUE:Hide();--1
		CE_ART_INFO_MAGE:Hide();--2
		CE_ART_INFO_AUGUR:Hide();--3
		CE_ART_INFO_SCOUT:Hide();--4
		CE_ART_INFO_UNDEFINED:Show();--5
		CE_ART_INFO_DRUID:Hide();--6
		CE_ART_INFO_WARRIOR:Hide();--7
		CE_ART_INFO_KNIGHT:Hide();--8
		CE_ART_INFO_BARD:Hide();--9
		CE_ART_INFO_WARDEN:Hide();--10
		CE_ART_INFO_WARLOCK:Hide();--11
		CE_ART_INFO_PSYRON:Hide();--12
		COMBATENGINE_EDIT_LUA_ART:SetFile( undefined );

	end

end





