(clear)


(mapclass Cliente)
(mapclass Perfil)




	
	


(defrule PerfilDeportista1
	
	
	(object (is-a Cliente)  (perfiles $?pe ) (pref_jardin TRUE) (contaminacion_baja TRUE) (zona_verde_cerca FALSE) (gim_cerca FALSE) (criminalidad_baja FALSE) (OBJECT ?c))
	(object (is-a Perfil)(nombre "deportista")(valoracion 1)(OBJECT ?p))
	(test (not (member$ ?p ?pe)))
	=>
	
	(slot-insert$ ?c perfiles 1 ?p)
	
)

(defrule PerfilDeportista2
	
	
	(object (is-a Cliente)  (perfiles $?pe ) (pref_jardin TRUE) (contaminacion_baja TRUE) (zona_verde_cerca TRUE) (gim_cerca TRUE) (criminalidad_baja FALSE) (OBJECT ?c))
	(object (is-a Perfil)(nombre "deportista")(valoracion 2)(OBJECT ?p))
	(test (not (member$ ?p ?pe)))
	=>
	
	(slot-insert$ ?c perfiles 1 ?p)
	
)
(defrule PerfilDeportista3
	
	
	(object (is-a Cliente)  (perfiles $?pe ) (pref_jardin TRUE) (contaminacion_baja TRUE) (zona_verde_cerca TRUE) (gim_cerca TRUE) (criminalidad_baja TRUE) (OBJECT ?c))
	(object (is-a Perfil)(nombre "deportista" )(valoracion 3)(OBJECT ?p))
	(test (not (member$ ?p ?pe)))
	=>
	
	(slot-insert$ ?c perfiles 1 ?p)
	
)

(defrule PerfilDeportista0
	(declare(salience -100))
	
	(object (is-a Cliente)  (perfiles $?pe ) (pref_jardin ?j) (contaminacion_baja ?cb) (zona_verde_cerca ?zv) (gim_cerca ?gc) (criminalidad_baja ?crb) (OBJECT ?c))
	
	
	(object(is-a Perfil)(OBJECT ?p1)(nombre "deportista")(valoracion 1))
	(test (not (member$ ?p1 ?pe)))
	(object(is-a Perfil)(OBJECT ?p2)(nombre "deportista")(valoracion 2))
	(test (not (member$ ?p2 ?pe)))
	(object(is-a Perfil)(OBJECT ?p3)(nombre "deportista")(valoracion 3))
	(test (not (member$ ?p3 ?pe)))
	(object(is-a Perfil)(OBJECT ?p0)(nombre "deportista")(valoracion 0))
	(test (not (member$ ?p0 ?pe)))
	
	
	
	
	
	
	(object(is-a Perfil)(OBJECT ?p)(nombre "deportista")(valoracion 0))
	=>
	
	(slot-insert$ ?c perfiles 1 ?p)
	
)



(reset)
(run) 
(facts) 

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
