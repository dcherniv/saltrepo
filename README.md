/pillar stores some configuration variables that we want to make available to the states.  
/salt stores your states that you can apply to the targets.  
Execution usually starts with top.sls for both pillars and states.  
 So for states it would be /salt/top.sls which includes other substates that you define.  
 substate can be defined in a file or a directory.   
   in case if its a file it would be STATE.sls  
   in case of a directory it would be /STATE/init.sls  
