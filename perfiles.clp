(clear)


(mapclass Cliente)
(mapclass Perfil)




	
	
(defrule PerfilDeportista
	
	
	(object (is-a Cliente)  (perfiles $?pe ) (pref_jardin TRUE) (contaminacion_baja TRUE) (zona_verde_cerca TRUE) (gim_cerca TRUE) (criminalidad_baja TRUE) (OBJECT ?c))
	(object (is-a Perfil)(nombre "deportista")(OBJECT ?p))
	(test (not (member$ ?p ?pe)))
	=>
	
	(slot-insert$ ?c perfiles 1 ?p)
	
	
	
	)



	
(defrule PerfilRural
	
	
	(object (is-a Cliente)(contaminacion_baja TRUE)(criminalidad_baja TRUE)(pref_chimenea TRUE)(pref_jardin TRUE)(zona_verde_cerca TRUE)(centro_urbano_cerca FALSE)(poligono_comercial_cerca FALSE)(transporte_accesible TRUE)(perfiles $?pe)(OBJECT ?c))
	(object (is-a Perfil)(nombre "Rural")(OBJECT ?p))
	(test (not (member$ ?p ?pe)))
	=>
	(slot-insert$ ?c perfiles 1 ?p)
	
	)

(defrule PerfilComercial
	
	
	(object (is-a Cliente)(zona_verde_cerca FALSE)(parking TRUE)(gim_cerca TRUE)(centro_urbano_cerca TRUE)(poligono_comercial_cerca TRUE)(colegio_cerca FALSE)(transporte_accesible TRUE)(perfiles $?pe)(OBJECT ?c))
	(object (is-a Perfil)(nombre "Comercial")(OBJECT ?p))
	(test (not (member$ ?p ?pe)))
	=>
	(slot-insert$ ?c perfiles 1 ?p)
	
	)
	
(defrule PerfilFamiliar
	
	(object (is-a Cliente)(contaminacion_baja TRUE)(criminalidad_baja TRUE)(pref_jardin TRUE)(parking TRUE)(colegio_cerca TRUE)(transporte_accesible TRUE)(perfiles $?pe)(OBJECT ?c))
	(object (is-a Perfil)(nombre "Familiar")(OBJECT ?p))
	(test (not (member$ ?p ?pe)))
	=>
	(slot-insert$ ?c perfiles 1 ?p)
	
	)
	
(defrule PerfilEmpresario
	
	
	(object (is-a Cliente)(pref_chimenea FALSE)(pref_jardin TRUE)(zona_verde_cerca FALSE)(parking TRUE)(gim_cerca TRUE)(centro_urbano_cerca TRUE)(colegio_cerca TRUE)(transporte_accesible TRUE)(perfiles $?pe)(OBJECT ?c))
	(object (is-a Perfil)(nombre "Empresario")(OBJECT ?p))
	(test (not (member$ ?p ?pe)))
	=>
	(slot-insert$ ?c perfiles 1 ?p)
	
	)
	
	

	




(reset)
(run) 
(facts) 
