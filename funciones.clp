(clear)

(mapclass Perfil)
(mapclass Cliente)
(mapclass Vivienda
(mapclass Distrito)


;para los clientes que tengan perfil deportista

(defrule CDPiso
	(object (is-a Cliente)(OBJECT ?c)(nombre ?n)  (perfiles $? ?pe $? )(recomendaciones $? ?re $?))
	(object(is-a Perfil)(nombre "deportista")(OBJECT ?p)); si tiene como perfil deportista
	(test(eq ?pe ?p));si tiene el cliente perfil deportista
	
	;dar un valor a los pisos que ya cumplen las necesidades dependiendo 
	;con una variable que  que va acumulando el total()
	
	(object(is-a Piso)(OBJECT ?piso)(distrito ?dis))
	(test(eq ?piso ?re)); 
	
	(object(is-a Distrito)(contaminacion ?co)(criminalidad ?cri)(OBJECT ?di))
	(test(eq ?dis ?di)) ; el didtrito en en el que esta el piso
	
	(bind ?total 0)
	
	; funcion si la contaminacion y la criminalidad son bajas cuma dos a total por cada una que coincida
	;funcion suma 1  a total si el piso tiene jardin
	;funcion suma 3  a toral si el distrito tiene gimnasio
	; funcion suma 2 para poligono cerca y centro urbano cerca  si el distrito es centrico
	; funcion suma 2 poe la zona verde
	; funcin suma 
	=>
	(printout t ?c " " ?n " "?total crlf); cacar el piso el nombre del perfil y ?total
	)
	



	
	
(reset)
(run)
(facts)

; t = total n= contribucio de ese slot  si se cumple ?a= atributo de la vivienda
(deffunction fun(?t ?n))