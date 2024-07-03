######################################################################
##     Cálculo de tamaño de núcleo de reproductores                 ##
##     Lafayette - Indiana, 16 de abril del 2024                    ##
##     Basado en Muller, J. 2010.                                   ##
##     https://www.produccion-animal.com.ar/produccion_de_camelidos/camelidos_general/156-estategias.pdf
##     gerardocmamani@gmail.com                                     ##
######################################################################

rm(list = ls()); gc()
options(scipen = 999)
#population <- 4000000
#participation <- 0.1
#females <- 0.5
c_hembras_base <- 2000000
#c_hembras_base <- population*participation*females

porcentaje_machos <- 0.05  # 1 male for 20 females
reemplazo <- 5             # 5 year each
tasa_reproductiva <- 0.64
prop_machos <- 0.5         # proporcion de machos por parto
i_select_m <- 0.5          # intensidad de selección de machos

c_machos_base <- c_hembras_base*porcentaje_machos

b_hembras_multi <- round((c_machos_base/reemplazo)/(tasa_reproductiva*prop_machos),0)
b_machos_multi <- round(b_hembras_multi*porcentaje_machos,0)

a_hembras_nucleo <- round(((b_machos_multi/reemplazo)/(tasa_reproductiva*prop_machos*i_select_m)),0)
a_machos_nucleo <- round((a_hembras_nucleo*porcentaje_machos),0)

# Un solo núcleo 
un_nucleo <- c(a_hembras_nucleo, a_machos_nucleo)
cat("Número de hembras en núcleo:",round(un_nucleo[1], 0))
cat("Número de machos en núcleo:",round(un_nucleo[2], 0))

# Núcleo disperso
nucleos <- 2
disperso_nucleo <- un_nucleo/nucleos
cat("Número de hembras en cada núcleo disperso","de" ,nucleos, "nucleos:",round(disperso_nucleo[1], 0))
cat("Número de machos en cada núcleo disperso","de" ,nucleos, "nucleos:",round(disperso_nucleo[2], 0))

