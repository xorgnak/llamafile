require 'httparty'
module LLAMA                                                                                                                                                                                     
  class Llama                                                                                                                                                                                    
    include HTTParty                                                                                                                                                                             
    base_uri 'http://127.0.0.1:8080'                                                                                                                                                             
  end                                                                                                                                                                                            
                                                                                                                                                                                                 
  @@P = {                                                                                                                                                                                        
    respond: %[Respond simply and directly with as few words possible.],                                                                                                                         
    answer: %[Answer questions from the user as honestly and correctly as possible.],                                                                                                            
    friend: %[Respond in a helpful friendly manner.],                                                                                                                                            
    nanny: %[Construct a story based upon things you are told.],                                                                                                                                 
    truth: %[Respond truthfully.]                                                                                                                                                                
  }                                                                                                                                                                                              
                                                                                                                                                                                                 
  def self.prompt                                                                                                                                                                                
    @@P                                                                                                                                                                                          
  end                                                                                                                                                                                            
                                                                                                                                                                                                 
                                                                                                                                                                                                 
  def self.flagz                                                                                                                                                                                 
    Llama.get('/flagz')                                                                                                                                                                          
  end                                                                                                                                                                                            
                                                                                                                                                                                                 
  def self.post p, *i                                                                                                                                                                            
    h = LLAMA.flagz.to_h                                                                                                                                                                         
    h['prompt'] = p                                                                                                                                                                              
    h['messages'] = [i].flatten                                                                                                                                                                  
    puts %[LLAMA POST #{h}]                                                                                                                                                                      
    r = Llama.post('/v1/chat/completions',                                                                                                                                                       
                   body: JSON.generate(h),                                                                                                                                                       
                   headers: {                                                                                                                                                                    
                     'Content-Type' => 'application/json',                                                                                                                                       
                     'Accept' => 'application/json',                                                                                                                                             
                     'Prefer' => 'wait'                                                                                                                                                          
                   })                                                                                                                                                                            
    r['choices'][0]['message']['content']                                                                                                                                                        
  end                                                                                                                                                                                            
end

