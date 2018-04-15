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

(defrule ViviendaEmpresario2

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
