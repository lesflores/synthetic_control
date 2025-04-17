# ¿Qué necesitas para aplicar el método Synthetic Control?
# 1. Datos panel 
# 2. Unidad tratada (lugar donde se implemento la polpúb) y varias unidades no tratadas
# 3. Variable resultado y variables predictoras

# Fuente: https://cran.r-project.org/web/packages/Synth/Synth.pdf



# install.packages("Synth")
library(Synth)

datos # nombre de la base de datos

# Parámetros para el modelo 

dataprep_modelo <- dataprep(
  foo = datos,
  predictors = c("educacion", "empleo_fem"),   # Variables predictoras 
  predictors.op = "mean",                      
  time.predictors.prior = 2005:2011,           # Años previos a la polpúb
  dependent = "brecha_salarial",               # Variable de resultado
  unit.variable = "unidad",                    
  time.variable = "anio",                     
  treatment.identifier = 5,                    # Núm asignado del estado tratado
  controls.identifier = c(1:4,6:10),           # Núm asignado de los controles(Edos no tratados)
  time.optimize.ssr = 2005:2011,            
  time.plot = 2005:2020)                       # Años a graficar


# Ejecutar el modelo 

synth.out <- synth(dataprep_modelo)
