function main_pacifist_tank

% initialize my small pacifist
myPanzer = initialize();

% Start patrolling
startPatroll(myPanzer.motorRight, myPanzer.motorLeft, myPanzer.sonicSensor, myPanzer)

end

% Patrolling function
function startPatroll(motorA, motorB, ultrasonicSensor, brick)
    vec= zeros(1,8);
    while 1 %for some time.... need a stop
        drive(motorA, motorB, ultrasonicSensor); %drives until its 10 cm away from a Wall
        brick.motorC.limitValue = 45;
        brick.motorC.power = 50;
        for i =1:8                          %takes Values for every 45 degrees
            vec(i) = brick.sensor4.value; 
            brick.motorC.start;
            brick.motorC.waitFor();
        end
    brick.motorC.limitValue = 360;
    brick.motorC.power = -50;
    brick.motorC.start;
    brick.motorC.waitFor();
    vec(4:6)=0;
    [maxValue, index] = min(vec);       %takes the index of the first biggest value for realignment
    index= index-1;
    brick.beep();
    turn(index, brick);
    endfunction main_pacifist_tank

% initialize my small pacifist
myPanzer = initialize();

% Start patrolling
startPatroll(myPanzer.motorRight, myPanzer.motorLeft, myPanzer.sonicSensor, myPanzer)

end

% Patrolling function
function startPatroll(motorA, motorB, ultrasonicSensor, brick)
    vec= zeros(1,8);
    while 1 %for some time.... need a stop
        drive(motorA, motorB, ultrasonicSensor); %drives until its 10 cm away from a Wall
        brick.motorC.limitValue = 45;
        brick.motorC.power = 50;
        for i =1:8                          %takes Values for every 45 degrees
            vec(i) = brick.sensor4.value; 
            brick.motorC.start;
            brick.motorC.waitFor();
        end
    brick.motorC.limitValue = 360;
    brick.motorC.power = -50;
    brick.motorC.start;
    brick.motorC.waitFor();
    vec(4:6)=0;
    [maxValue, index] = min(vec);       %takes the index of the first biggest value for realignment
    index= index-1;
    brick.beep();
    turn(index, brick);
    end
end

% Checking is this Ally or Enemy Bilding
%function checkForAlly

%end

% Fire 1 shot
function Fire(motorD)
    motorD.limitValue = 360;
    motorD.power = -50;
    motorD.start;
    motorD.waitFor();
end

% Check if target hitted
function isTargetHit

end

% Initialize all Sensors, Morors
function myPanzer = initalize() 
        brickObj = EV3();SonicRead
        %brickObj.connect('usb')            
        brickObj.connect('bt', 'serPort', '/dev/rfcomm0')
        brickObj.beep();
        motorLeft = brickObj.motorA;
        motorRight = brickObj.motorB;
        %motorRotation = brickObj.motorC;
        sonicSensor = brickObj.sensor4;
        myPanzer.brick = brickObj;
        myPanzer.motorLeft = motorLeft;
        myPanzer.motorRight = motorRight;
        %myPanzer.motorRotation = motorRotation;
        myPanzer.sonicSensor = sonicSensor;
        sonicSensor.mode = DeviceMode.UltraSonic.DistCM;
end

% Checking distance to the target
function distance = SonicRead(brickObj) % Check distance
        brickObj.mode = DeviceMode.UltraSonic.DistCM;
        distance = brickObj.value;
end


function turn(index, brick) %tursn the brick (realignment)
    if index == 0
        return;
    end
    if index == 1 || index == 2|| index == 3 || index == 4
       mymotor= brick.motorA;
       mymotor.power = 50;
    end
    if index == 5 || index == 6|| index == 7    
        vect = [0 0 0 0 3 2 1];
        index = vect(index);
        
    mymotor= brick.motorB;
    mymotor.power = 50;
    
    end
    mymotor.brakeMode = 'Brake';
    mymotor.limitValue = index*190; %%%%find vALUE
    mymotor.start();
    mymotor.waitFor()
end


function drive(motorL, motorR, sensor) % Start motors   
    motor R.syncedStart(motorL);
    while 1
        if sensor.value < 50 && sensor.value ~= -1
            synchronizedStop(motorL, motorR);
            Fire();
            break;
        end
    end
end 

function synchronizedStop(motorL, motorR) % Synch Stop
    
    motorL.stop();
    motorR.stop();
  
end
end

% Checking is this Ally or Enemy Bilding
%function checkForAlly

%end

% Fire 1 shot
function Fire(motorD)
    motorD.limitValue = 360;
    motorD.power = -50;
    motorD.start;
    motorD.waitFor();
end

% Check if target hitted
function isTargetHit

end

% Initialize all Sensors, Morors
function myPanzer = initalize() 
        brickObj = EV3();SonicRead
        %brickObj.connect('usb')            
        brickObj.connect('bt', 'serPort', '/dev/rfcomm0')
        brickObj.beep();
        motorLeft = brickObj.motorA;
        motorRight = brickObj.motorB;
        %motorRotation = brickObj.motorC;
        sonicSensor = brickObj.sensor4;
        myPanzer.brick = brickObj;
        myPanzer.motorLeft = motorLeft;
        myPanzer.motorRight = motorRight;
        %myPanzer.motorRotation = motorRotation;
        myPanzer.sonicSensor = sonicSensor;
        sonicSensor.mode = DeviceMode.UltraSonic.DistCM;
end

% Checking distance to the target
function distance = SonicRead(brickObj) % Check distance
        brickObj.mode = DeviceMode.UltraSonic.DistCM;
        distance = brickObj.value;
end


function turn(index, brick) %tursn the brick (realignment)
    if index == 0
        return;
    end
    if index == 1 || index == 2|| index == 3 || index == 4
       mymotor= brick.motorA;
       mymotor.power = 50;
    end
    if index == 5 || index == 6|| index == 7    
        vect = [0 0 0 0 3 2 1];
        index = vect(index);
        
    mymotor= brick.motorB;
    mymotor.power = 50;
    
    end
    mymotor.brakeMode = 'Brake';
    mymotor.limitValue = index*190; %%%%find vALUE
    mymotor.start();
    mymotor.waitFor()
end


function drive(motorL, motorR, sensor) % Start motors   
    motor R.syncedStart(motorL);
    while 1
        if sensor.value < 50 && sensor.value ~= -1
            synchronizedStop(motorL, motorR);
            Fire();
            break;
        end
    end
end 

function synchronizedStop(motorL, motorR) % Synch Stop
    
    motorL.stop();
    motorR.stop();
  
end