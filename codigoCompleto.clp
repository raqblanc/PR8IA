(clear)

(mapclass Vivienda)
(mapclass Cliente)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;; REGLA PARA RECOMENDAR LAS VIVIENDAS SEGÚN ;;;;;;;;;;;;;
;;;;;;;;;;;;; SUS NECESIDADES. SIN MINUSVALÍA ;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;; UTILIZANDO HERENCIA ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule necesidadesSinMinusvaliaHerencia

  (object (OBJECT ?v)(precio ?p) (dormitorios ?dor))

  (test (member$ Vivienda(class-superclasses (class ?v) inherit) ))
  (object (is-a Cliente)(nombre ?nom)(presupuesto ?pre)(minusvalia FALSE)(num_familiares ?fam) (nombre ?nom)(recomendaciones $?re)(OBJECT ?c))
  (test (not (member$ ?v ?re)))
  (test (>= ?dor ?fam))
  (test (<= ?p ?pre))

  =>
  (printout t  ?nom crlf)
  (slot-insert$ ?c recomendaciones 1 ?v)
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;; REGLAS PARA RECOMENDAR LAS VIVIENDAS SEGÚN ;;;;;;;;;;;;
;;;;;;;;;;;;; SUS NECESIDADES. CON MINUSVALÍA ;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule necesidadesPisoMinusvalia
	(object (is-a Piso)(planta ?pl)(ascensor ?asc)(dormitorios ?dor)(precio ?p) (OBJECT ?v))

	(object (is-a Cliente)(nombre ?nom)(presupuesto ?pre)(minusvalia TRUE)(num_familiares ?fam) (nombre ?nom)(recomendaciones $?re)(OBJECT ?c))
	(test (not (member$ ?v ?re)))
	(test (>= ?dor ?fam))
	(test (<= ?p ?pre))

	(or(test (eq ?asc TRUE))(test (eq ?pl bajo)) )


	=>
	(printout t  ?nom crlf)
	(slot-insert$ ?c recomendaciones 1 ?v)

)

(defrule necesidadesChalet
		(object (is-a Chalet)(dormitorios ?dor)(precio ?p)(OBJECT ?v))

		(object (is-a Cliente)(nombre ?nom)(presupuesto ?pre)(minusvalia ?min)(num_familiares ?fam) (nombre ?nom)(recomendaciones $?re)(OBJECT ?c))
		(test (not (member$ ?v ?re)))
		(test (>= ?dor ?fam))
		(test (<= ?p ?pre))

		=>
		(printout t  ?nom crlf)
		(slot-insert$ ?c recomendaciones 1 ?v)
)

(defrule necesidadesEstudioMinusvalia
	(object (is-a Estudio)(ascensor ?asc)(dormitorios ?dor)(precio ?p) (OBJECT ?v))

	(object (is-a Cliente)(nombre ?nom)(presupuesto ?pre)(minusvalia TRUE)(num_familiares ?fam) (nombre ?nom)(recomendaciones $?re)(OBJECT ?c))
	(test (not (member$ ?v ?re)))
	(test (>= ?dor ?fam))
	(test (<= ?p ?pre))

	(test (eq ?asc TRUE))


	=>
  (printout t  ?nom crlf)

	(slot-insert$ ?c recomendaciones 1 ?v)

)




(reset)
(run)
(facts)

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

(clear)

(mapclass Vivienda)
(mapclass Perfil)
(mapclass Distrito)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;; PERFIL DEPORTISTA ;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule ViviendaDeportista3

	(object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
  (test (member$ Vivienda(class-superclasses (class ?b) inherit) ))
	(object(is-a Distrito)(OBJECT ?dis)(nombre ?no)(contaminacion 0)(criminalidad 0)(zonas_verdes TRUE )(num_colegios ?num_coles))
	;;si no hay colegios se supone que hay gimnasios
	(test (eq ?num_coles 0))
	(object(is-a Perfil)(OBJECT ?p)(nombre "deportista")(valoracion 3))

	(test (not (member$ ?p ?per)))


	=>
	(slot-insert$ ?b perfiles 1 ?p)
	(printout t ?b " " ?no crlf)

 )




 (defrule ViviendaDeportista2

	(object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
  (test (member$ Vivienda(class-superclasses (class ?b) inherit) ))
	(object(is-a Distrito)(OBJECT ?dis)(nombre ?no)(contaminacion 1)(criminalidad 1)(zonas_verdes TRUE )(num_colegios ?num_coles))


	(test (eq ?num_coles 0))
	(object(is-a Perfil)(OBJECT ?p)(nombre "deportista")(valoracion 2))

	(test (not (member$ ?p ?per)))


	=>
	(slot-insert$ ?b perfiles 1 ?p)
	(printout t ?b " " ?no crlf)

 )



 (defrule ViviendaDeportista1

	(object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
  (test (member$ Vivienda(class-superclasses (class ?b) inherit) ))
	(object(is-a Distrito)(OBJECT ?dis)(nombre ?no)(contaminacion 2)(criminalidad 3)(zonas_verdes TRUE)(num_colegios ?num_coles))
	(test (eq ?num_coles 0))
	(object(is-a Perfil)(OBJECT ?p)(nombre "deportista")(valoracion 1))

	(test (not (member$ ?p ?per)))



	=>
	(slot-insert$ ?b perfiles 1 ?p)
	(printout t ?b " " ?no crlf)

 )


 (defrule ViviendaDeportista0
	(declare(salience -100))
	(object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
    (test (member$ Vivienda(class-superclasses (class ?b) inherit) ))

	(object(is-a Distrito)(OBJECT ?dis)(nombre ?no)(contaminacion ?f)(criminalidad ?o)(zonas_verdes ?u ))

	(object(is-a Perfil)(OBJECT ?p1)(nombre "deportista")(valoracion 1))
	(object(is-a Perfil)(OBJECT ?p2)(nombre "deportista")(valoracion 2))
	(object(is-a Perfil)(OBJECT ?p3)(nombre "deportista")(valoracion 3))
	(object(is-a Perfil)(OBJECT ?p0)(nombre "deportista")(valoracion 0))

	(test (not (member$ ?p1 ?per)))
	(test (not (member$ ?p2 ?per)))
	(test (not (member$ ?p3 ?per)))
	(test (not (member$ ?p0 ?per)))

	(object(is-a Perfil)(OBJECT ?p)(nombre "deportista")(valoracion 0))



	=>
	(slot-insert$ ?b perfiles 1 ?p)
	(printout t ?b " " ?no crlf)

 )



 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;; PERFIL RURAL ;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 (defrule ViviendaRural3

 	(object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
  (test (member$ Vivienda(class-superclasses (class ?b) inherit) ))
 	(object(is-a Distrito)(OBJECT ?dis)(nombre ?no)(contaminacion 0)(criminalidad 0)(zonas_verdes TRUE))

 	(object(is-a Perfil)(OBJECT ?p)(nombre "rural")(valoracion 3))

 	(test (not (member$ ?p ?per)))


 	=>
 	(slot-insert$ ?b perfiles 1 ?p)
 	(printout t ?b " " ?no crlf)

  )

	(defrule ViviendaRural2

  	(object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
   (test (member$ Vivienda(class-superclasses (class ?b) inherit) ))
  	(object(is-a Distrito)(OBJECT ?dis)(nombre ?no)(contaminacion 0)(criminalidad 1)(zonas_verdes TRUE))

  	(object(is-a Perfil)(OBJECT ?p)(nombre "rural")(valoracion 2))

  	(test (not (member$ ?p ?per)))


  	=>
  	(slot-insert$ ?b perfiles 1 ?p)
  	(printout t ?b " " ?no crlf)

   )

	 (defrule ViviendaRural1

		 (object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
		 (test (member$ Vivienda(class-superclasses (class ?b) inherit) ))
		 (object(is-a Distrito)(OBJECT ?dis)(nombre ?no)(contaminacion 0)(criminalidad 2)(zonas_verdes TRUE))

		 (object(is-a Perfil)(OBJECT ?p)(nombre "rural")(valoracion 1))

		 (test (not (member$ ?p ?per)))


		 =>
		 (slot-insert$ ?b perfiles 1 ?p)
		 (printout t ?b " " ?no crlf)

		 )


		 (defrule ViviendaRural0
	(declare(salience -100))
	 	 (object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
	 	 (test (member$ Vivienda(class-superclasses (class ?b) inherit) ))

	 	 (object(is-a Distrito)(nombre ?no)(OBJECT ?dis))

	 	 (object(is-a Perfil)(OBJECT ?p1)(nombre "rural")(valoracion 1))
	 	 (object(is-a Perfil)(OBJECT ?p2)(nombre "rural")(valoracion 2))
	 	 (object(is-a Perfil)(OBJECT ?p3)(nombre "rural")(valoracion 3))
	 	 (object(is-a Perfil)(OBJECT ?p0)(nombre "rural")(valoracion 0))

	 	 (test (not (member$ ?p1 ?per)))
	 	 (test (not (member$ ?p2 ?per)))
	 	 (test (not (member$ ?p3 ?per)))
	 	 (test (not (member$ ?p0 ?per)))

	 	 (object(is-a Perfil)(OBJECT ?p)(nombre "rural")(valoracion 0))



	 	 =>
	 	 (slot-insert$ ?b perfiles 1 ?p)
	 	 (printout t ?b " " ?no crlf)

	 	)

		 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		 ;;;;;;;;;;;;;;;;;;;; PERFIL FAMILIAR ;;;;;;;;;;;;;;;;;;;;;
		 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		 (defrule ViviendaFamiliar3

			 (object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
			 (test (member$ Vivienda(class-superclasses (class ?b) inherit) ))
			 (object(is-a Distrito)(OBJECT ?dis)(nombre ?no)(contaminacion 0)(criminalidad 0)(num_colegios ?num_coles))
			 (test (neq ?num_coles 0))

			 (object(is-a Perfil)(OBJECT ?p)(nombre "familiar")(valoracion 3))

			 (test (not (member$ ?p ?per)))


			 =>
			 (slot-insert$ ?b perfiles 1 ?p)
			 (printout t ?b " " ?no crlf)

			 )

			 (defrule ViviendaFamiliar2

				 (object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
				 (test (member$ Vivienda(class-superclasses (class ?b) inherit) ))
				 (object(is-a Distrito)(OBJECT ?dis)(nombre ?no)(contaminacion 1)(criminalidad 0)(num_colegios ?num_coles))
				 (test (neq ?num_coles 0))

				 (object(is-a Perfil)(OBJECT ?p)(nombre "familiar")(valoracion 2))

				 (test (not (member$ ?p ?per)))


				 =>
				 (slot-insert$ ?b perfiles 1 ?p)
				 (printout t ?b " " ?no crlf)

				 )

				 (defrule ViviendaFamiliar1

					 (object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
					 (test (member$ Vivienda(class-superclasses (class ?b) inherit) ))
					 (object(is-a Distrito)(OBJECT ?dis)(nombre ?no)(contaminacion 2)(criminalidad 0)(num_colegios ?num_coles))
					 (test (neq ?num_coles 0))

					 (object(is-a Perfil)(OBJECT ?p)(nombre "familiar")(valoracion 1))

					 (test (not (member$ ?p ?per)))


					 =>
					 (slot-insert$ ?b perfiles 1 ?p)
					 (printout t ?b " " ?no crlf)

					 )

					 (defrule ViviendaFamiliar0
	(declare(salience -100))
						(object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
					  (test (member$ Vivienda(class-superclasses (class ?b) inherit) ))

						(object(is-a Distrito)(nombre ?no)(OBJECT ?dis))

						(object(is-a Perfil)(OBJECT ?p1)(nombre "familiar")(valoracion 1))
						(object(is-a Perfil)(OBJECT ?p2)(nombre "familiar")(valoracion 2))
						(object(is-a Perfil)(OBJECT ?p3)(nombre "familiar")(valoracion 3))
						(object(is-a Perfil)(OBJECT ?p0)(nombre "familiar")(valoracion 0))

						(test (not (member$ ?p1 ?per)))
						(test (not (member$ ?p2 ?per)))
						(test (not (member$ ?p3 ?per)))
						(test (not (member$ ?p0 ?per)))

						(object(is-a Perfil)(OBJECT ?p)(nombre "familiar")(valoracion 0))



						=>
						(slot-insert$ ?b perfiles 1 ?p)
						(printout t ?b " " ?no crlf)

					 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;; PERFIL COMERCIAL ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule ViviendaComercial3

	(object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
	(test (member$ Vivienda(class-superclasses (class ?b) inherit) ))
	(object(is-a Distrito)(OBJECT ?dis)(nombre ?no)(contaminacion 2)(criminalidad 0)(num_colegios ?num_coles))
	(test (eq ?num_coles 0))

	(object(is-a Perfil)(OBJECT ?p)(nombre "comercial")(valoracion 3))

	(test (not (member$ ?p ?per)))


	=>
	(slot-insert$ ?b perfiles 1 ?p)
	(printout t ?b " " ?no crlf)

	)

	(defrule ViviendaComercial2

		(object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
		(test (member$ Vivienda(class-superclasses (class ?b) inherit) ))
		(object(is-a Distrito)(OBJECT ?dis)(nombre ?no)(contaminacion 2)(criminalidad 0))


		(object(is-a Perfil)(OBJECT ?p)(nombre "comercial")(valoracion 2))

		(test (not (member$ ?p ?per)))


		=>
		(slot-insert$ ?b perfiles 1 ?p)
		(printout t ?b " " ?no crlf)

	)

	(defrule ViviendaComercial1

		(object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
		(test (member$ Vivienda(class-superclasses (class ?b) inherit) ))
		(object(is-a Distrito)(OBJECT ?dis)(nombre ?no)(contaminacion 3)(criminalidad 0))


		(object(is-a Perfil)(OBJECT ?p)(nombre "comercial")(valoracion 1))

		(test (not (member$ ?p ?per)))


		=>
		(slot-insert$ ?b perfiles 1 ?p)
		(printout t ?b " " ?no crlf)

	)

	(defrule ViviendaComercial0
	(declare(salience -100))
	 (object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
	 (test (member$ Vivienda(class-superclasses (class ?b) inherit) ))

	 (object(is-a Distrito)(nombre ?no)(OBJECT ?dis))

	 (object(is-a Perfil)(OBJECT ?p1)(nombre "comercial")(valoracion 1))
	 (object(is-a Perfil)(OBJECT ?p2)(nombre "comercial")(valoracion 2))
	 (object(is-a Perfil)(OBJECT ?p3)(nombre "comercial")(valoracion 3))
	 (object(is-a Perfil)(OBJECT ?p0)(nombre "comercial")(valoracion 0))

	 (test (not (member$ ?p1 ?per)))
	 (test (not (member$ ?p2 ?per)))
	 (test (not (member$ ?p3 ?per)))
	 (test (not (member$ ?p0 ?per)))

	 (object(is-a Perfil)(OBJECT ?p)(nombre "comercial")(valoracion 0))



	 =>
	 (slot-insert$ ?b perfiles 1 ?p)
	 (printout t ?b " " ?no crlf)

	)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;; PERFIL EMPRESARIO ;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule ViviendaEmpresario3

	(object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
	(test (member$ Vivienda(class-superclasses (class ?b) inherit) ))
	(object(is-a Distrito)(OBJECT ?dis)(nombre ?no)(contaminacion 3)(criminalidad 0)(num_colegios ?num_coles))
	(test (eq ?num_coles 0))


	(object(is-a Perfil)(OBJECT ?p)(nombre "empresario")(valoracion 3))

	(test (not (member$ ?p ?per)))


	=>
	(slot-insert$ ?b perfiles 1 ?p)
	(printout t ?b " " ?no crlf)

)

(defrule ViviendaEmpresario2

	(object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
	(test (member$ Vivienda(class-superclasses (class ?b) inherit) ))
	(object(is-a Distrito)(OBJECT ?dis)(nombre ?no)(contaminacion 2)(criminalidad 0)(num_colegios ?num_coles))
	(test (eq ?num_coles 0))


	(object(is-a Perfil)(OBJECT ?p)(nombre "empresario")(valoracion 2))

	(test (not (member$ ?p ?per)))


	=>
	(slot-insert$ ?b perfiles 1 ?p)
	(printout t ?b " " ?no crlf)

)

(defrule ViviendaEmpresario1

	(object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
	(test (member$ Vivienda(class-superclasses (class ?b) inherit) ))
	(object(is-a Distrito)(OBJECT ?dis)(nombre ?no)(contaminacion 2)(criminalidad 1)(num_colegios ?num_coles))
	(test (eq ?num_coles 0))


	(object(is-a Perfil)(OBJECT ?p)(nombre "empresario")(valoracion 1))

	(test (not (member$ ?p ?per)))


	=>
	(slot-insert$ ?b perfiles 1 ?p)
	(printout t ?b " " ?no crlf)

)

(defrule ViviendaEmpresario0
	(declare(salience -100))
 (object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
 (test (member$ Vivienda(class-superclasses (class ?b) inherit) ))

 (object(is-a Distrito)(nombre ?no)(OBJECT ?dis))

 (object(is-a Perfil)(OBJECT ?p1)(nombre "empresario")(valoracion 1))
 (object(is-a Perfil)(OBJECT ?p2)(nombre "empresario")(valoracion 2))
 (object(is-a Perfil)(OBJECT ?p3)(nombre "empresario")(valoracion 3))
 (object(is-a Perfil)(OBJECT ?p0)(nombre "empresario")(valoracion 0))

 (test (not (member$ ?p1 ?per)))
 (test (not (member$ ?p2 ?per)))
 (test (not (member$ ?p3 ?per)))
 (test (not (member$ ?p0 ?per)))

 (object(is-a Perfil)(OBJECT ?p)(nombre "empresario")(valoracion 0))



 =>
 (slot-insert$ ?b perfiles 1 ?p)
 (printout t ?b " " ?no crlf)

)

(reset)
(run)
(facts)



(clear )

(mapclass Cliente)
(mapclass Perfil)
(mapclass Vivienda)
(mapclass vivienda_perfil_puntos)

(deftemplate vivienda_perfil_puntos
	(slot perfil)
	(slot puntos)
	(slot vivienda)
	(slot nombre))








(defrule final

	(object (is-a Cliente)(OBJECT ?c)(nombre ?nom)(perfiles $? ?pe $? )(recomendaciones $? ?b $?)(NyP $?np))

	(object(is-a Perfil)(OBJECT ?pe)(nombre ?per)(valoracion ?val1))


	(object (OBJECT ?b) (perfiles $? ?p $?))
    (test (member$ Vivienda(class-superclasses (class ?b) inherit) ))


	(object(is-a Perfil)(OBJECT ?p)(nombre ?per)(valoracion ?val2))

	(test (neq ?val1 0))
	(test (neq ?val2 0))

	=>
	(printout t ?c " "  crlf)
	(make-instance of vivienda_perfil_puntos (cliente ?nom)(perfil "deportista")(vivienda ?b)(puntos (* ?val1 ?val2)))



)
(reset)
(run)


(clear)

(mapclass Cliente)
(mapclass Perfil)
(mapclass Vivienda)
(mapclass vivienda_perfil_puntos)

(deftemplate vivienda_perfil_puntos
	(slot perfil)
	(slot puntos)
	(slot vivienda)
	(slot nombre))

(defrule asignacion
     (declare(salience -100))
	(object (is-a Cliente)(OBJECT ?c)(nombre ?nom)(NyP $?np))

	(object(is-a vivienda_perfil_puntos )(OBJECT ?v)(cliente ?nom))


	(test (not (member$ ?v ?np)))
	=>
	(slot-insert$ ?c NyP 1 ?v)
	(printout t ?nom " " ?v  crlf)

)


(reset)
(run)
