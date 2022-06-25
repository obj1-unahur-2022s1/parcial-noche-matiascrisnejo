/*
 * Usar la delegación en métodos auxiliares. En  ```estaSatisfecho()``` de Comensales no delegaste para sumar los pesos, 
 * y si lo hicieste bien en DePaladarFino y Vegetarianos para la condicion adicional.
 */
import comidas.*

class Comensales {
	const comidasQueComio = []
	var property peso
	
	method leAgrada(unaComida)

	method comer(unaComida) = comidasQueComio.add(unaComida)
	//
	method estaSatisfecho() = comidasQueComio.sum({ c => c.peso()})  >= peso/100 
	
}


class Vegetarianos inherits Comensales{
	
	override method leAgrada(unaComida) = unaComida.aptoVegetariano() and (unaComida.suValoracion() > 85)
	override method estaSatisfecho() = super() and self.comidasNoAbundantes()
	method comidasNoAbundantes() =  comidasQueComio.all({ c => not c.esAbundante() })
}

class Hambrepopular inherits Comensales{
	
	override method leAgrada(unaComida) = unaComida.esAbundante()
	
}

class DePaladarFino inherits Comensales{
	
	override method leAgrada(unaComida) = unaComida.peso().between(150,300) and unaComida.suValoracion() > 100
	override method estaSatisfecho()= super() and self.cantidadDeComidaQueComioEsPar()
	method cantidadDeComidaQueComioEsPar() =  comidasQueComio.size().even()
	
}