import comidas.*
import comensales.*

object cocina{
	
	const comidasPreparadas = []
	
	method tieneBuenaOfertaVegetariana() = (self.cantComidasVegetarianas()- self.cantComidasNoVegetarianas()).abs() <= 2

	method cantComidasVegetarianas() = comidasPreparadas.count({ c => c.aptoVegetariano() })
	
	method cantComidasNoVegetarianas() = comidasPreparadas.count({ c => not c.aptoVegetariano() })
	
	method ComidasNoVegetarianas()= comidasPreparadas.filter({ c => not c.aptoVegetariano() })
	
	method platoFuerteCarnivoro() = self.ComidasNoVegetarianas().max({c => c.valoracion() })
	
	method comidasQueLeGustan(unComensal) = comidasPreparadas.filter({ c => unComensal.leAgrada(c) })
		
	method poderElegirPlato(unComensal) {if (self.noComidasPreparadas())
										self.error("NO HAY PLATOS")
										comidasPreparadas.anyOne({ c =>unComensal.leAgrada(c)})
										
										}
	 
	
	method noComidasPreparadas() = comidasPreparadas.isEmpty()

	method sacarPlato(unaComida)= comidasPreparadas.remove(unaComida)
	
	
}							
								