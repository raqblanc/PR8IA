(clear)


(mapclass Cliente)
(mapclass Perfil)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;; PERFIL DEPORTISTA ;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;; PERFIL RURAL ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule PerfilRural1


	(object (is-a Cliente)  (perfiles $?pe ) (contaminacion_baja FALSE) (criminalidad_baja FALSE) (pref_chimenea FALSE)(pref_jardin TRUE) (zona_verde_cerca TRUE) (centro_urbano_cerca FALSE) (poligono_comercial_cerca FALSE) (transporte_accesible FALSE)(OBJECT ?c))
	(object (is-a Perfil)(nombre "rural")(valoracion 1)(OBJECT ?p))
	(test (not (member$ ?p ?pe)))
	=>

	(slot-insert$ ?c perfiles 1 ?p)

)

(defrule PerfilRural2


	(object (is-a Cliente)  (perfiles $?pe ) (contaminacion_baja FALSE) (criminalidad_baja FALSE) (pref_chimenea TRUE)(pref_jardin TRUE) (zona_verde_cerca TRUE) (centro_urbano_cerca FALSE) (poligono_comercial_cerca FALSE)(transporte_accesible FALSE) (OBJECT ?c))
	(object (is-a Perfil)(nombre "rural")(valoracion 2)(OBJECT ?p))
	(test (not (member$ ?p ?pe)))
	=>

	(slot-insert$ ?c perfiles 1 ?p)

)

(defrule PerfilRural3


	(object (is-a Cliente)  (perfiles $?pe ) (contaminacion_baja TRUE) (criminalidad_baja TRUE) (pref_chimenea TRUE)(pref_jardin TRUE) (zona_verde_cerca TRUE) (centro_urbano_cerca FALSE) (poligono_comercial_cerca FALSE) (transporte_accesible FALSE)(OBJECT ?c))
	(object (is-a Perfil)(nombre "rural")(valoracion 3)(OBJECT ?p))
	(test (not (member$ ?p ?pe)))
	=>

	(slot-insert$ ?c perfiles 1 ?p)

)

(defrule PerfilRural0
	(declare(salience -100))

	(object (is-a Cliente)  (perfiles $?pe ) (pref_jardin ?j) (contaminacion_baja ?cb) (zona_verde_cerca ?zv) (gim_cerca ?gc) (criminalidad_baja ?crb) (OBJECT ?c))


	(object(is-a Perfil)(OBJECT ?p1)(nombre "rural")(valoracion 1))
	(test (not (member$ ?p1 ?pe)))
	(object(is-a Perfil)(OBJECT ?p2)(nombre "rural")(valoracion 2))
	(test (not (member$ ?p2 ?pe)))
	(object(is-a Perfil)(OBJECT ?p3)(nombre "rural")(valoracion 3))
	(test (not (member$ ?p3 ?pe)))
	(object(is-a Perfil)(OBJECT ?p0)(nombre "rural")(valoracion 0))
	(test (not (member$ ?p0 ?pe)))


	(object(is-a Perfil)(OBJECT ?p)(nombre "rural")(valoracion 0))
	=>

	(slot-insert$ ?c perfiles 1 ?p)

)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;; PERFIL COMERCIAL ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule PerfilComercial3


	(object (is-a Cliente)  (perfiles $?pe ) (zona_verde_cerca FALSE)(parking TRUE)(gim_cerca TRUE)(centro_urbano_cerca TRUE)(poligono_comercial_cerca TRUE)(colegio_cerca FALSE)(transporte_accesible TRUE)(OBJECT ?c))
	(object (is-a Perfil)(nombre "comercial")(valoracion 3)(OBJECT ?p))
	(test (not (member$ ?p ?pe)))
	=>

	(slot-insert$ ?c perfiles 1 ?p)

)

(defrule PerfilComercial2


	(object (is-a Cliente)  (perfiles $?pe ) (zona_verde_cerca FALSE)(parking TRUE)(gim_cerca FALSE)(centro_urbano_cerca TRUE)(poligono_comercial_cerca TRUE)(colegio_cerca TRUE)(transporte_accesible TRUE)(OBJECT ?c))
	(object (is-a Perfil)(nombre "comercial")(valoracion 2)(OBJECT ?p))
	(test (not (member$ ?p ?pe)))
	=>

	(slot-insert$ ?c perfiles 1 ?p)

)

(defrule PerfilComercial1


	(object (is-a Cliente)  (perfiles $?pe ) (zona_verde_cerca TRUE)(parking TRUE)(gim_cerca FALSE)(centro_urbano_cerca TRUE)(poligono_comercial_cerca TRUE)(colegio_cerca TRUE)(transporte_accesible FALSE)(OBJECT ?c))
	(object (is-a Perfil)(nombre "comercial")(valoracion 1)(OBJECT ?p))
	(test (not (member$ ?p ?pe)))
	=>

	(slot-insert$ ?c perfiles 1 ?p)

)

(defrule PerfilComercial0
	(declare(salience -100))

	(object (is-a Cliente)  (perfiles $?pe ) (pref_jardin ?j) (contaminacion_baja ?cb) (zona_verde_cerca ?zv) (gim_cerca ?gc) (criminalidad_baja ?crb) (OBJECT ?c))


	(object(is-a Perfil)(OBJECT ?p1)(nombre "comercial")(valoracion 1))
	(test (not (member$ ?p1 ?pe)))
	(object(is-a Perfil)(OBJECT ?p2)(nombre "comercial")(valoracion 2))
	(test (not (member$ ?p2 ?pe)))
	(object(is-a Perfil)(OBJECT ?p3)(nombre "comercial")(valoracion 3))
	(test (not (member$ ?p3 ?pe)))
	(object(is-a Perfil)(OBJECT ?p0)(nombre "comercial")(valoracion 0))
	(test (not (member$ ?p0 ?pe)))


	(object(is-a Perfil)(OBJECT ?p)(nombre "comercial")(valoracion 0))
	=>

	(slot-insert$ ?c perfiles 1 ?p)

)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;; PERFIL FAMILIAR ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule PerfilFamiliar3

	(object (is-a Cliente)(contaminacion_baja TRUE)(criminalidad_baja TRUE)(pref_jardin TRUE)(parking TRUE)(colegio_cerca TRUE)(transporte_accesible TRUE)(perfiles $?pe)(OBJECT ?c))
	(object (is-a Perfil)(nombre "familiar")(valoracion 3)(OBJECT ?p))
	(test (not (member$ ?p ?pe)))
	=>
	(slot-insert$ ?c perfiles 1 ?p)

)

(defrule PerfilFamiliar2

	(object (is-a Cliente)(contaminacion_baja FALSE)(criminalidad_baja TRUE)(pref_jardin FALSE)(parking TRUE)(colegio_cerca TRUE)(transporte_accesible TRUE)(perfiles $?pe)(OBJECT ?c))
	(object (is-a Perfil)(nombre "familiar")(valoracion 2)(OBJECT ?p))
	(test (not (member$ ?p ?pe)))
	=>
	(slot-insert$ ?c perfiles 1 ?p)

)

(defrule PerfilFamiliar1

	(object (is-a Cliente)(contaminacion_baja FALSE)(criminalidad_baja FALSE)(pref_jardin FALSE)(parking TRUE)(colegio_cerca TRUE)(transporte_accesible TRUE)(perfiles $?pe)(OBJECT ?c))
	(object (is-a Perfil)(nombre "familiar")(valoracion 1)(OBJECT ?p))
	(test (not (member$ ?p ?pe)))
	=>
	(slot-insert$ ?c perfiles 1 ?p)

)

(defrule PerfilFamiliar0
	(declare(salience -100))

	(object (is-a Cliente)  (perfiles $?pe ) (pref_jardin ?j) (contaminacion_baja ?cb) (zona_verde_cerca ?zv) (gim_cerca ?gc) (criminalidad_baja ?crb) (OBJECT ?c))


	(object(is-a Perfil)(OBJECT ?p1)(nombre "familiar")(valoracion 1))
	(test (not (member$ ?p1 ?pe)))
	(object(is-a Perfil)(OBJECT ?p2)(nombre "familiar")(valoracion 2))
	(test (not (member$ ?p2 ?pe)))
	(object(is-a Perfil)(OBJECT ?p3)(nombre "familiar")(valoracion 3))
	(test (not (member$ ?p3 ?pe)))
	(object(is-a Perfil)(OBJECT ?p0)(nombre "familiar")(valoracion 0))
	(test (not (member$ ?p0 ?pe)))


	(object(is-a Perfil)(OBJECT ?p)(nombre "familiar")(valoracion 0))
	=>

	(slot-insert$ ?c perfiles 1 ?p)

)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;; PERFIL EMPRESARIO ;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule PerfilEmpresario3


	(object (is-a Cliente)(pref_chimenea FALSE)(pref_jardin FALSE)(zona_verde_cerca FALSE)(parking TRUE)(gim_cerca TRUE)(centro_urbano_cerca TRUE)(colegio_cerca FALSE)(transporte_accesible TRUE)(perfiles $?pe)(OBJECT ?c))
	(object (is-a Perfil)(nombre "empresario")(valoracion 3)(OBJECT ?p))
	(test (not (member$ ?p ?pe)))
	=>
	(slot-insert$ ?c perfiles 1 ?p)

)

(defrule PerfilEmpresario2


	(object (is-a Cliente)(pref_chimenea TRUE)(pref_jardin TRUE)(zona_verde_cerca FALSE)(parking TRUE)(gim_cerca TRUE)(centro_urbano_cerca TRUE)(colegio_cerca FALSE)(transporte_accesible TRUE)(perfiles $?pe)(OBJECT ?c))
	(object (is-a Perfil)(nombre "empresario")(valoracion 2)(OBJECT ?p))
	(test (not (member$ ?p ?pe)))
	=>
	(slot-insert$ ?c perfiles 1 ?p)

)

(defrule PerfilEmpresario1


	(object (is-a Cliente)(pref_chimenea TRUE)(pref_jardin TRUE)(zona_verde_cerca TRUE)(parking TRUE)(gim_cerca TRUE)(centro_urbano_cerca TRUE)(colegio_cerca TRUE)(transporte_accesible TRUE)(perfiles $?pe)(OBJECT ?c))
	(object (is-a Perfil)(nombre "empresario")(valoracion 1)(OBJECT ?p))
	(test (not (member$ ?p ?pe)))
	=>
	(slot-insert$ ?c perfiles 1 ?p)

)


(defrule PerfilEmpresario0
	(declare(salience -100))

	(object (is-a Cliente)  (perfiles $?pe ) (pref_jardin ?j) (contaminacion_baja ?cb) (zona_verde_cerca ?zv) (gim_cerca ?gc) (criminalidad_baja ?crb) (OBJECT ?c))


	(object(is-a Perfil)(OBJECT ?p1)(nombre "empresario")(valoracion 1))
	(test (not (member$ ?p1 ?pe)))
	(object(is-a Perfil)(OBJECT ?p2)(nombre "empresario")(valoracion 2))
	(test (not (member$ ?p2 ?pe)))
	(object(is-a Perfil)(OBJECT ?p3)(nombre "empresario")(valoracion 3))
	(test (not (member$ ?p3 ?pe)))
	(object(is-a Perfil)(OBJECT ?p0)(nombre "empresario")(valoracion 0))
	(test (not (member$ ?p0 ?pe)))


	(object(is-a Perfil)(OBJECT ?p)(nombre "empresario")(valoracion 0))
	=>

	(slot-insert$ ?c perfiles 1 ?p)

)





(reset)
(run)
(facts)
