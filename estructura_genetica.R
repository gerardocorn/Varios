############################################################
##     Cálculo de tamaño de núcleo de reproductores       ##
##     Donoso - Huaral, 06 de diciembre del 2021          ##
##     Basado en Muller, J. 2010.                         ##
##     https://inta.gob.ar/sites/default/files/script-tmp-inta-estrategias_para_el_mejoramiento_de_camlidos_sud.pdf
##     gerardocmamani@gmail.com                           ##
############################################################

rm(list = ls()); gc()

c_hembras_base <- 2000000

porcentaje_machos <- 0.05  # 1 macho por 19 hembras aprox
reemplazo <- 5             # cada 5 años
tasa_reproductiva <- 0.64
prop_machos <- 0.5         # proporcion de machos por parto
i_select_m <- 0.5          # intensidad de selección de machos

c_machos_base <- (c_hembras_base*porcentaje_machos)/reemplazo

b_hembras_multi <- c_machos_base/(tasa_reproductiva*prop_machos)

b_machos_multi <- (b_hembras_multi*porcentaje_machos)/reemplazo

a_hembras_nucleo <- b_machos_multi/(tasa_reproductiva*prop_machos*i_select_m)

a_machos_nucleo <- a_hembras_nucleo*porcentaje_machos

# Un solo núcleo 
un_nucleo <- c(a_hembras_nucleo, a_machos_nucleo)
cat("Número de hembras en núcleo:",round(un_nucleo[1], 0))
cat("Número de machos en núcleo:",round(un_nucleo[2], 0))

# Núcleo disperso
nucleos <- 8
disperso_nucleo <- un_nucleo/nucleos
cat("Número de hembras en cada núcleo disperso","de" ,nucleos, "nucleos:",round(disperso_nucleo[1], 0))
cat("Número de machos en cada núcleo disperso","de" ,nucleos, "nucleos:",round(disperso_nucleo[2], 0))

