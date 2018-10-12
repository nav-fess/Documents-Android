# How to run test using profile

1. Install:
   - Genymotion last version. Install Documents app in the emulator.
   - Virtualbox last version
   - Install gems via bundle 

2. Put app Documents in folder support

3. Make a profile in cucumber.yml for report. (https://docs.cucumber.io/cucumber/configuration/)  
Example cucumber.yml:  
portalGoogle: -t @portalSocialNetwork --format html --out portalGoogle.html

4. Make profile PortalTypeData.json
Example PortalTypeData.json:  
{  
  "info": "xxx.xxx.info|login|password",  
  ....  
  ....  
  "com": "xxx.xxx.com|login|password"  
}

5. Run 
   - Genymotion 
   - RubyMine    
   - appium via console
   - cucumber via console ( example: cucumber -p [profile] )



. 

