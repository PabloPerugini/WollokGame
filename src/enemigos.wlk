class Orco {
    var fuerza 
    var destreza 
    var vidas = 1
    var vitalidad = 100

    method fuerza() = fuerza
    
    method destreza() = destreza

    method vidas() = vidas
    method bajarUnaVida() {vidas = 0.max(vidas - 1)}

    method vitalidad() = vitalidad
    method subirVitalidad(unaCantidad) { vitalidad = 100.min(vitalidad + unaCantidad) }
    method bajarVitalidad(unaCantidad) { vitalidad = 0.max(vitalidad - unaCantidad) }   

    method estaVivo() = vitalidad > 0

    method caer() {}

    method cantidadDePoder() = (destreza * fuerza)/10

    method atacar(unEnemigo){
        const cantVital = unEnemigo.vitalidad()
        if(unEnemigo.estaVivo()){
            unEnemigo.bajarVitalidad(self.cantidadDePoder())
        }
    }
    
    method recivirUnAtaque(unEnemigo) {
        if (self.estaVivo()){
            self.bajarVitalidad(unEnemigo.cantidadDePoder())
        }
        else{
            self.caer()
        }
    }
  
}
