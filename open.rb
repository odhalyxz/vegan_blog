require 'json'
template = File.open("template.html", "r") # Abrimos el archivo template.txt y leemos el contenido
lines_Template = template.readlines #Lo almacenamos en una variable        
template.close

total_files = [1,2,3,4,5] #Archivos totales
total_files.each do |i|
#input = File.open("input"+i.to_s+".txt", "r") #Abrimos el archivo input.txt y leemos el contenido 
#lines_Input = input.readlines       #Lo almacenamos en una variable    
#input.close

file = File.read('input/input'+i.to_s+'.json')
data_hash = JSON.parse(file)

 puts "-------------------------------------------"

#somefile.puts "Hello file!"
inputE = "entrada"+i.to_s+".html"
somefile = File.open(inputE, "w")
	lines_Template.each{ |rowTemplate| 
		if rowTemplate.match("@titulo")
			somefile.puts data_hash['titulo']
		else
	    	if rowTemplate.match("@contenido")
				somefile.puts data_hash['posts']
			else
	    		if rowTemplate.match("@autor")
					somefile.puts data_hash['autor']
				else
	    			if rowTemplate.match("@fecha")
						somefile.puts data_hash['fecha']
					else
	    				somefile.puts rowTemplate
	   				end
	   			end
	   		end
	   	end
	}
	somefile.close
end


#----------------------


