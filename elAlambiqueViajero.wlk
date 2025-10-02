object luke{
    var cantidadViajes = 0
    var recuerdo = "Llavero Torre Eiffel"
    var property vehiculo = alambiqueVeloz

    method cambiarVehiculo(nuevoVehiculo) {vehiculo = nuevoVehiculo}
    method cantidadViajes() = cantidadViajes 

    method viajar(lugar){
        if (lugar.puedeLlegar(vehiculo)) {
            cantidadViajes = cantidadViajes + 1
            recuerdo = lugar.recuerdoTipico()
            vehiculo.desgaste()
        }
    }
    method puedeLlegar(unaCiudad) =  unaCiudad.puedellegar(vehiculo)
    method recuerdo() = recuerdo
    method cantidadDeViajes() = cantidadViajes
}

object alambiqueVeloz {
    var rapido = true
    //var patente = "AB123JK"
    var combustible = 60
    const consumoPorViaje = 10
    method rapido() = rapido
    method puedeFuncionar() = combustible >= consumoPorViaje
    method desgaste() { combustible = combustible - consumoPorViaje }
    //method patenteValida() = patente.head() == "A"
    method recorrer(ciudad) {
    if (combustible > 0) {
        combustible = combustible - 10
        } else {
        rapido = false
        }
    }
    method combustible() = combustible
    method consumoPorViaje() = consumoPorViaje
    method velocidad() = 80
}

object paris{
    method recuerdoTipico() = "Llavero Torre Eiffel"
    method puedeLlegar(movil) =  movil.puedeFuncionar()
    method tieneCombustible(movil) = movil.combustible() 
    
}

object buenosAires{
    method recuerdoTipico() = "Mate"
    method puedeLlegar(auto) =  auto.rapido()
    method tieneCombustible(auto) = auto.combustible() 
}

object bagdad {
    var recuerdo = "bidon de petroleo"
    method cambiarRecuerdo(nuevoRecuerdo) {recuerdo = nuevoRecuerdo }
    method recuerdoTipico() = recuerdo
    method puedeLlegar(cualquierCosa) = true
}

object lasVegas{
    var homenaje = paris
    method homenaje(nuevoHomenaje) {homenaje = nuevoHomenaje}
    method recuerdoTipico() = homenaje.recuerdoTipico()
    method puedeLlegar(vehiculo) = homenaje.puedeLlegar(vehiculo)
}

object hurlingham{
    method recuerdoTipico() = "sticker de la Unahur"
    method puedeLlegar(vehiculo) = vehiculo.puedeFuncionar() and vehiculo.rapido() 
}

object  antigualla {
    var gangster = 7
    method puedeFuncionar() = gangster.even()
    method desgaste() {gangster = gangster  - 1}
    method rapido() = gangster > 6
    method recorrer(ciudad) {
    if (gangster < 7) {
        self.desgaste()
    }
}
method velocidad()= 60
}
object chatarra {
    var cañones = 10
    var municiones = 100
    method puedeFuncionar() = municiones == 100 && cañones.between(6,12)
    method combustible() = cañones * 10
    method desgaste() {
        cañones = cañones - 1
        municiones = municiones - 10
    }
    method cañones() = cañones  
    method rapido()  = cañones > 8
    method recorrer(ciudad) {
    if (cañones > 0 and municiones > 0) {
        self.desgaste()
    }
    }
    method velocidad() = 50
}

object superConvertible {
    var convertido = antigualla
    method convertir(vehiculo) {convertido = vehiculo}
    method puedeFuncionar() = convertido.puedeFuncionar()
    method desgaste() {convertido.desgaste()}
    method esRapido() = convertido.esRapido()
    method recorrer(ciudad) {
    if (convertido.puedeFuncionar()) {
        convertido.recorrer(ciudad)
        } 
    }
    method velocidad() = convertido.velocidad()
}
object moto {
    method rapido() = true
    method puedeFuncionar() = self.rapido()
    method desgaste() {}
    method patenteValida() = false
    method recorrer(ciudad) {}
    method velocidad() = 100
}

object antiguallaBlindada{
    const gangsters = ["Marcos","Javier","Lucho","Yanina","Jony","Mecha","Brian"]
    method puedeFuncionar() = gangsters.size().even()
    method rapido() = gangsters.size() > 6
    method desgaste(){
        gangsters.remove(gangsters.anyOne())
    }
    method velocidad(){
        return gangsters.sum({c=>c.size()*15})
    }
    method subirAUnGangster(unGangster){
       gangsters.add(unGangster)
    }
      method bajarAUnGangster(unGangster){
       gangsters.remove(unGangster)
    }  
    method gangsters() = gangsters
    method recorrer(ciudad) {}
}

object patanCar{
    var velocidad = 90
    method rapido() = true
    method puedeFuncionar() = !self.rapido()
    method desgaste(){}
    method velocidad()= velocidad
    method hacerTrampa(){
      velocidad = 0.max(velocidad*0.05)
    }
    method recorrer(ciudad){
       self.hacerTrampa()
    }

}

object locovichCar{
    const listadoCars = [superConvertible,chatarra,antigualla ]
    var vehiculo = chatarra
    method vehiculo() = vehiculo
    method cambiarVehiculo(){
        vehiculo = listadoCars.anyOne()
    }
    method velocidad() = vehiculo.velocidad()
    method rapido() = vehiculo.rapido()
    method puedeFuncionar() = vehiculo.puedeFuncionar()
    method desgaste() = vehiculo.desgaste()
    method recorrer(destino) {
    if (vehiculo.puedeFuncionar()) {
        vehiculo.recorrer(destino)
        }
    } 
} 