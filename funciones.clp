(clear)

(mapclass Perfil)
(mapclass Cliente)
(mapclass Vivienda)
(mapclass Distrito)

(defrule clienteDeportistaPiso
	(object (is-a Cliente)(OBJECT ?c)(nombre ?n)  (perfiles $? ?pe $?)(recomendaciones $? ?re $?))
  (object(is-a Perfil)(nombre "deportista")(OBJECT ?p)) ;si tiene como perfil deportista
	(test(eq ?pe ?p)) ;si tiene el cliente perfil deportista

  (object(is-a Piso)(OBJECT ?piso)(distrito ?dis))
	(test(eq ?piso ?re));
  (object(is-a Distrito)(contaminacion ?co)(criminalidad ?cri)(tiene_gimnasio ?gim)(zonas_verdes ?zv)(OBJECT ?di))
	(test(eq ?dis ?di)) ; el didtrito en en el que esta el piso

  (bind ?suma 0)

  (if (eq ?zv TRUE) then
           (bind ?suma (+ ?suma 1))
         else
            (bind ?suma (+ ?suma 0))
  )
  ;(if (= ?zv TRUE) then TRUE)
  ;(if (= ?gim TRUE) then (bind ?suma (+ ?suma 1)))
  ;(if (= ?co TRUE) then (bind ?suma (+ ?suma 2)))
  ;(if (= ?cri TRUE) then (bind ?suma(+ ?suma 2)))
  =>
  (printout t ?c " " ?n " ")
)

(reset)
(run)
(facts)
