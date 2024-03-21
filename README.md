# Why?
Because sometimes local llamafile interactions on local hardware with local data is the only option.

# BEFORE
1. wget -O llamafile <your llamafile download url>
2. chmod +x llamafile
3. sudo mv lamafile /usr/bin/llama

## Installation
### bundle
```
bundle add llamafile
```
### gems
```
gem install llamafile
```
## Usage
### module
Pass a raw string to the module and 
```
Llamafile.llama("What is the meaning of life?") => { input: "What is the meaning of life?", output: "42." }
```
### include
```
class X
	include Llamafile
	def initialize k
		@id = k
		@db = My.data[k]
	end
	def what_is_my_name?
		@prompt = %[My name is #{@db[:name]}.]
		h =	llama(%[#{@prompt}  What is my name?])
		return h[:output]
	end
end
```
