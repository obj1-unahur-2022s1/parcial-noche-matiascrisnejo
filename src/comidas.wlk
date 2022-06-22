class Plato {
 var property peso
 	
 
	
	method aptoVegetariano()
	method esAbundante()= peso > 250
	method suValoracion()
}

class Provoleta inherits Plato{
	var property tieneEspecies
	
	override method aptoVegetariano() = not tieneEspecies
	method esEspecial() = self.esAbundante() or tieneEspecies
	override method suValoracion() = if(self.esEspecial()){120}else{80}
	
}

class HamburguesaDeCarne inherits Plato{
	
	var property pan
	
	override method peso() = 250
	override method aptoVegetariano() = false
	override method suValoracion()= 60 + self.valoracionDePan()
	
	method valoracionDePan() = if(pan == "industrial"){0}
							 else if(pan == "casero"){20}
							 else{45} 
	
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








