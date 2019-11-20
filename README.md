# How to run test using profile

1. Install:
   - Genymotion last version. Install Documents app in the emulator.
   - Virtualbox last version
   - Install gems via bundle 

2. Put app Documents in folder 'manager'

3. Make .json files for each spec in folder "data"

Example PersonalLoginData.json:  
``` 
{  
  "personal1":  
  {  
   "email":"email_name",  
   "p":"pass"  
  },  
  "personal2":  
  {  
   "email":"facebook",  
   "fblogin":"email_for_facebook",  
   "fbp":"pass_facebook"  
  },  
  "personal3":  
  {   
   "email":"google"  
  }  
}   
``` 
5. Run 
   - Genymotion 
   - RubyMine    
   - appium via console
   - rspec via console ( example: rspec name_spec.rb -t tag_name:value )



 

