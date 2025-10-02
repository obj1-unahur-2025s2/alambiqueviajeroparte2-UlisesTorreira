import elAlambiqueViajero.*

object inscripcion {
    const inscriptos = []
    const rechazados = []
    var property ciudad = paris

    method inscribirAuto(unAuto)     { inscriptos.add([unAuto]) }
    method rechazarAuto(unAuto)      { rechazados.add([unAuto]) }
    method cambioDeCiudad(unaCiudad) {   ciudad = unaCiudad     } 
    method inscriptos() = inscriptos
    method rechazados() = rechazados
    method inscripcionACarrera(unAuto) {
            if (ciudad.puedeLlegar(unAuto)){
                self.inscribirAuto(unAuto)
            }
            else{
                self.rechazarAuto(unAuto)
            }
    }
    method replanificacionDeCarrera(unaCiudad) {
        const nuevaVerificacion = []
        self.cambioDeCiudad(unaCiudad)
        nuevaVerificacion.addAll(inscriptos)
        nuevaVerificacion.addAll(rechazados)
        inscriptos.clear()
        rechazados.clear()
        nuevaVerificacion.forEach({a=>self.inscripcionACarrera(a)})
    }
    method irAlaCarrera(){
        inscriptos.forEach({a=>self.inscripcionACarrera(a)})
    }
    method ganador(){
        return inscriptos.max({c=>c.velocidad()})
    }  
}
