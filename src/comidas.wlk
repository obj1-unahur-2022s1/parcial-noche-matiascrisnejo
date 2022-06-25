/* La mejor opción para manejar el peso en las comidas era la siguiente
. método abstracto peso en Plato
. const property peso en Provoleta
. en esAbundante() usar self.peso()
. En los test no hace falta pasarle el peso a las hamburguesas y a la parrillada
/*
 * 
 */ 

/* Los panes debían ser 3 objetos y a la hamburguesa debías configurar el pan
 * y preguntarle a cada pan su puntuacion
 object panIndustrial{
	method puntos()= 0
}

object panCasero{
	method puntos()= 20
}

object panDeMasa{
	method puntos()= 45
}	
 */

class Plato {
 	//var property peso
 	method peso()
 	
	
	method aptoVegetariano()
	method esAbundante()= self.peso() > 250
	method suValoracion()
}

class Provoleta inherits Plato{
	var property tieneEspecies
	const property peso
	
	override method aptoVegetariano() = not tieneEspecies
	method esEspecial() = self.esAbundante() or tieneEspecies
	override method suValoracion() = if(self.esEspecial()){120}else{80}
	
}

class HamburguesaDeCarne inherits Plato{
	
	const property pan 
	
	override method peso() = 250
	override method aptoVegetariano() = false
	override method suValoracion()= 60 + pan.puntos()
	

	
}

class Hamburguesavegetariana inherits HamburguesaDeCarne{
	const property legumbre
	
		
	override method aptoVegetariano() = true
	override method suValoracion()= super() + 17.min(2 * self.cantidadDeLetrasDeLegumbre())
	method cantidadDeLetrasDeLegumbre() = legumbre.size()
}

class Parrillada inherits Plato{
	const cortesPedidos = []
	
	override method peso() = cortesPedidos.sum({ c => c.peso() })
	override method aptoVegetariano() = false
	override method suValoracion() = 0.max(15 * self.maximaCalidadDeCorte()- self.cantidadDeCortes())
	method maximaCalidadDeCorte() = cortesPedidos.max({ c => c.calidad() }).calidad()
	method cantidadDeCortes() = cortesPedidos.size()
	method agregarCorte(unCorte)= cortesPedidos.add(unCorte)
}


class CorteDeCarne{
	
	var property calidad
	var property peso
	
}

object panIndustrial{
	method puntos()= 0
}

object panCasero{
	method puntos()= 20
}

object panDeMasa{
	method puntos()= 45
}






