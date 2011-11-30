#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
include Makefile

# Environment
MKDIR=mkdir -p
RM=rm -f 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/AVIPlayer.${IMAGE_TYPE}.elf
else
IMAGE_TYPE=production
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/AVIPlayer.${IMAGE_TYPE}.elf
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files
OBJECTFILES=${OBJECTDIR}/AVIPlayer.o ${OBJECTDIR}/CODECAudio.o ${OBJECTDIR}/FSIO.o ${OBJECTDIR}/SD-SPI.o ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o ${OBJECTDIR}/_ext/1360899539/MMB.o ${OBJECTDIR}/_ext/1360899539/TouchScreen.o ${OBJECTDIR}/_ext/1575306571/gfxpmp.o ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o ${OBJECTDIR}/_ext/1713430119/Primitive.o ${OBJECTDIR}/_ext/221508487/TimeDelay.o


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

# Path to java used to run MPLAB X when this makefile was created
MP_JAVA_PATH=C:\\Program\ Files\ \(x86\)\\Java\\jre6/bin/
OS_CURRENT="$(shell uname -s)"
############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
MP_CC=C:\\Program\ Files\ \(x86\)\\Microchip\\MPLAB\ C32\ Suite\\bin\\pic32-gcc.exe
# MP_BC is not defined
MP_AS=C:\\Program\ Files\ \(x86\)\\Microchip\\MPLAB\ C32\ Suite\\bin\\pic32-as.exe
MP_LD=C:\\Program\ Files\ \(x86\)\\Microchip\\MPLAB\ C32\ Suite\\bin\\pic32-ld.exe
MP_AR=C:\\Program\ Files\ \(x86\)\\Microchip\\MPLAB\ C32\ Suite\\bin\\pic32-ar.exe
# MP_BC is not defined
MP_CC_DIR=C:\\Program\ Files\ \(x86\)\\Microchip\\MPLAB\ C32\ Suite\\bin
# MP_BC_DIR is not defined
MP_AS_DIR=C:\\Program\ Files\ \(x86\)\\Microchip\\MPLAB\ C32\ Suite\\bin
MP_LD_DIR=C:\\Program\ Files\ \(x86\)\\Microchip\\MPLAB\ C32\ Suite\\bin
MP_AR_DIR=C:\\Program\ Files\ \(x86\)\\Microchip\\MPLAB\ C32\ Suite\\bin
# MP_BC_DIR is not defined

.build-conf: ${BUILD_SUBPROJECTS}
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/AVIPlayer.${IMAGE_TYPE}.elf

MP_PROCESSOR_OPTION=32MX460F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/221508487/TimeDelay.o: ../Microchip/Common/TimeDelay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/221508487 
	@${RM} ${OBJECTDIR}/_ext/221508487/TimeDelay.o.d 
	@${RM} ${OBJECTDIR}/_ext/221508487/TimeDelay.o.ok ${OBJECTDIR}/_ext/221508487/TimeDelay.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/221508487/TimeDelay.o.d -o ${OBJECTDIR}/_ext/221508487/TimeDelay.o ../Microchip/Common/TimeDelay.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/221508487/TimeDelay.o.d -o ${OBJECTDIR}/_ext/221508487/TimeDelay.o ../Microchip/Common/TimeDelay.c   2>&1  > ${OBJECTDIR}/_ext/221508487/TimeDelay.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/221508487/TimeDelay.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/221508487/TimeDelay.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/221508487/TimeDelay.o.d > ${OBJECTDIR}/_ext/221508487/TimeDelay.o.tmp
	@${RM} ${OBJECTDIR}/_ext/221508487/TimeDelay.o.d 
	@${CP} ${OBJECTDIR}/_ext/221508487/TimeDelay.o.tmp ${OBJECTDIR}/_ext/221508487/TimeDelay.o.d 
	@${RM} ${OBJECTDIR}/_ext/221508487/TimeDelay.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/221508487/TimeDelay.o.err 
	@cat ${OBJECTDIR}/_ext/221508487/TimeDelay.o.err 
	@if [ -f ${OBJECTDIR}/_ext/221508487/TimeDelay.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/221508487/TimeDelay.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/1360899539/TouchScreen.o: ../MMB/TouchScreen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360899539 
	@${RM} ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.ok ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.d -o ${OBJECTDIR}/_ext/1360899539/TouchScreen.o ../MMB/TouchScreen.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.d -o ${OBJECTDIR}/_ext/1360899539/TouchScreen.o ../MMB/TouchScreen.c   2>&1  > ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.d > ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.d 
	@${CP} ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.tmp ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.err 
	@cat ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/1360899539/LCDTerminal.o: ../MMB/LCDTerminal.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360899539 
	@${RM} ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.ok ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.d -o ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o ../MMB/LCDTerminal.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.d -o ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o ../MMB/LCDTerminal.c   2>&1  > ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.d > ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.d 
	@${CP} ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.tmp ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.err 
	@cat ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.ok; else exit 1; fi
	
${OBJECTDIR}/CODECAudio.o: CODECAudio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/CODECAudio.o.d 
	@${RM} ${OBJECTDIR}/CODECAudio.o.ok ${OBJECTDIR}/CODECAudio.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/CODECAudio.o.d -o ${OBJECTDIR}/CODECAudio.o CODECAudio.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/CODECAudio.o.d -o ${OBJECTDIR}/CODECAudio.o CODECAudio.c   2>&1  > ${OBJECTDIR}/CODECAudio.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/CODECAudio.o.ok ; fi 
	@touch ${OBJECTDIR}/CODECAudio.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/CODECAudio.o.d > ${OBJECTDIR}/CODECAudio.o.tmp
	@${RM} ${OBJECTDIR}/CODECAudio.o.d 
	@${CP} ${OBJECTDIR}/CODECAudio.o.tmp ${OBJECTDIR}/CODECAudio.o.d 
	@${RM} ${OBJECTDIR}/CODECAudio.o.tmp
endif
	@touch ${OBJECTDIR}/CODECAudio.o.err 
	@cat ${OBJECTDIR}/CODECAudio.o.err 
	@if [ -f ${OBJECTDIR}/CODECAudio.o.ok ] ; then rm -f ${OBJECTDIR}/CODECAudio.o.ok; else exit 1; fi
	
${OBJECTDIR}/AVIPlayer.o: AVIPlayer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/AVIPlayer.o.d 
	@${RM} ${OBJECTDIR}/AVIPlayer.o.ok ${OBJECTDIR}/AVIPlayer.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/AVIPlayer.o.d -o ${OBJECTDIR}/AVIPlayer.o AVIPlayer.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/AVIPlayer.o.d -o ${OBJECTDIR}/AVIPlayer.o AVIPlayer.c   2>&1  > ${OBJECTDIR}/AVIPlayer.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/AVIPlayer.o.ok ; fi 
	@touch ${OBJECTDIR}/AVIPlayer.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/AVIPlayer.o.d > ${OBJECTDIR}/AVIPlayer.o.tmp
	@${RM} ${OBJECTDIR}/AVIPlayer.o.d 
	@${CP} ${OBJECTDIR}/AVIPlayer.o.tmp ${OBJECTDIR}/AVIPlayer.o.d 
	@${RM} ${OBJECTDIR}/AVIPlayer.o.tmp
endif
	@touch ${OBJECTDIR}/AVIPlayer.o.err 
	@cat ${OBJECTDIR}/AVIPlayer.o.err 
	@if [ -f ${OBJECTDIR}/AVIPlayer.o.ok ] ; then rm -f ${OBJECTDIR}/AVIPlayer.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o: ../MMB/LCDTerminalFont.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360899539 
	@${RM} ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.ok ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.d -o ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o ../MMB/LCDTerminalFont.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.d -o ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o ../MMB/LCDTerminalFont.c   2>&1  > ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.d > ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.d 
	@${CP} ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.tmp ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.err 
	@cat ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/1713430119/Primitive.o: ../Microchip/Graphics/Primitive.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Primitive.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Primitive.o.ok ${OBJECTDIR}/_ext/1713430119/Primitive.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1713430119/Primitive.o.d -o ${OBJECTDIR}/_ext/1713430119/Primitive.o ../Microchip/Graphics/Primitive.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1713430119/Primitive.o.d -o ${OBJECTDIR}/_ext/1713430119/Primitive.o ../Microchip/Graphics/Primitive.c   2>&1  > ${OBJECTDIR}/_ext/1713430119/Primitive.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1713430119/Primitive.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/1713430119/Primitive.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1713430119/Primitive.o.d > ${OBJECTDIR}/_ext/1713430119/Primitive.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1713430119/Primitive.o.d 
	@${CP} ${OBJECTDIR}/_ext/1713430119/Primitive.o.tmp ${OBJECTDIR}/_ext/1713430119/Primitive.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Primitive.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1713430119/Primitive.o.err 
	@cat ${OBJECTDIR}/_ext/1713430119/Primitive.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1713430119/Primitive.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1713430119/Primitive.o.ok; else exit 1; fi
	
${OBJECTDIR}/FSIO.o: FSIO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/FSIO.o.d 
	@${RM} ${OBJECTDIR}/FSIO.o.ok ${OBJECTDIR}/FSIO.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/FSIO.o.d -o ${OBJECTDIR}/FSIO.o FSIO.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/FSIO.o.d -o ${OBJECTDIR}/FSIO.o FSIO.c   2>&1  > ${OBJECTDIR}/FSIO.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/FSIO.o.ok ; fi 
	@touch ${OBJECTDIR}/FSIO.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/FSIO.o.d > ${OBJECTDIR}/FSIO.o.tmp
	@${RM} ${OBJECTDIR}/FSIO.o.d 
	@${CP} ${OBJECTDIR}/FSIO.o.tmp ${OBJECTDIR}/FSIO.o.d 
	@${RM} ${OBJECTDIR}/FSIO.o.tmp
endif
	@touch ${OBJECTDIR}/FSIO.o.err 
	@cat ${OBJECTDIR}/FSIO.o.err 
	@if [ -f ${OBJECTDIR}/FSIO.o.ok ] ; then rm -f ${OBJECTDIR}/FSIO.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/1360899539/MMB.o: ../MMB/MMB.C  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360899539 
	@${RM} ${OBJECTDIR}/_ext/1360899539/MMB.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360899539/MMB.o.ok ${OBJECTDIR}/_ext/1360899539/MMB.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1360899539/MMB.o.d -o ${OBJECTDIR}/_ext/1360899539/MMB.o ../MMB/MMB.C  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1360899539/MMB.o.d -o ${OBJECTDIR}/_ext/1360899539/MMB.o ../MMB/MMB.C   2>&1  > ${OBJECTDIR}/_ext/1360899539/MMB.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1360899539/MMB.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/1360899539/MMB.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1360899539/MMB.o.d > ${OBJECTDIR}/_ext/1360899539/MMB.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1360899539/MMB.o.d 
	@${CP} ${OBJECTDIR}/_ext/1360899539/MMB.o.tmp ${OBJECTDIR}/_ext/1360899539/MMB.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360899539/MMB.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1360899539/MMB.o.err 
	@cat ${OBJECTDIR}/_ext/1360899539/MMB.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1360899539/MMB.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1360899539/MMB.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/1713430119/DisplayDriver.o: ../Microchip/Graphics/DisplayDriver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.ok ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.d -o ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o ../Microchip/Graphics/DisplayDriver.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.d -o ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o ../Microchip/Graphics/DisplayDriver.c   2>&1  > ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.d > ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.d 
	@${CP} ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.tmp ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.err 
	@cat ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/1575306571/gfxpmp.o: ../Microchip/Graphics/Drivers/gfxpmp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.ok ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.d -o ${OBJECTDIR}/_ext/1575306571/gfxpmp.o ../Microchip/Graphics/Drivers/gfxpmp.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.d -o ${OBJECTDIR}/_ext/1575306571/gfxpmp.o ../Microchip/Graphics/Drivers/gfxpmp.c   2>&1  > ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.d > ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.d 
	@${CP} ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.tmp ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.err 
	@cat ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.ok; else exit 1; fi
	
${OBJECTDIR}/SD-SPI.o: SD-SPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/SD-SPI.o.d 
	@${RM} ${OBJECTDIR}/SD-SPI.o.ok ${OBJECTDIR}/SD-SPI.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/SD-SPI.o.d -o ${OBJECTDIR}/SD-SPI.o SD-SPI.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/SD-SPI.o.d -o ${OBJECTDIR}/SD-SPI.o SD-SPI.c   2>&1  > ${OBJECTDIR}/SD-SPI.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/SD-SPI.o.ok ; fi 
	@touch ${OBJECTDIR}/SD-SPI.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/SD-SPI.o.d > ${OBJECTDIR}/SD-SPI.o.tmp
	@${RM} ${OBJECTDIR}/SD-SPI.o.d 
	@${CP} ${OBJECTDIR}/SD-SPI.o.tmp ${OBJECTDIR}/SD-SPI.o.d 
	@${RM} ${OBJECTDIR}/SD-SPI.o.tmp
endif
	@touch ${OBJECTDIR}/SD-SPI.o.err 
	@cat ${OBJECTDIR}/SD-SPI.o.err 
	@if [ -f ${OBJECTDIR}/SD-SPI.o.ok ] ; then rm -f ${OBJECTDIR}/SD-SPI.o.ok; else exit 1; fi
	
else
${OBJECTDIR}/_ext/221508487/TimeDelay.o: ../Microchip/Common/TimeDelay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/221508487 
	@${RM} ${OBJECTDIR}/_ext/221508487/TimeDelay.o.d 
	@${RM} ${OBJECTDIR}/_ext/221508487/TimeDelay.o.ok ${OBJECTDIR}/_ext/221508487/TimeDelay.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/221508487/TimeDelay.o.d -o ${OBJECTDIR}/_ext/221508487/TimeDelay.o ../Microchip/Common/TimeDelay.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/221508487/TimeDelay.o.d -o ${OBJECTDIR}/_ext/221508487/TimeDelay.o ../Microchip/Common/TimeDelay.c   2>&1  > ${OBJECTDIR}/_ext/221508487/TimeDelay.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/221508487/TimeDelay.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/221508487/TimeDelay.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/221508487/TimeDelay.o.d > ${OBJECTDIR}/_ext/221508487/TimeDelay.o.tmp
	@${RM} ${OBJECTDIR}/_ext/221508487/TimeDelay.o.d 
	@${CP} ${OBJECTDIR}/_ext/221508487/TimeDelay.o.tmp ${OBJECTDIR}/_ext/221508487/TimeDelay.o.d 
	@${RM} ${OBJECTDIR}/_ext/221508487/TimeDelay.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/221508487/TimeDelay.o.err 
	@cat ${OBJECTDIR}/_ext/221508487/TimeDelay.o.err 
	@if [ -f ${OBJECTDIR}/_ext/221508487/TimeDelay.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/221508487/TimeDelay.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/1360899539/TouchScreen.o: ../MMB/TouchScreen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360899539 
	@${RM} ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.ok ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.d -o ${OBJECTDIR}/_ext/1360899539/TouchScreen.o ../MMB/TouchScreen.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.d -o ${OBJECTDIR}/_ext/1360899539/TouchScreen.o ../MMB/TouchScreen.c   2>&1  > ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.d > ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.d 
	@${CP} ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.tmp ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.err 
	@cat ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1360899539/TouchScreen.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/1360899539/LCDTerminal.o: ../MMB/LCDTerminal.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360899539 
	@${RM} ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.ok ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.d -o ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o ../MMB/LCDTerminal.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.d -o ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o ../MMB/LCDTerminal.c   2>&1  > ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.d > ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.d 
	@${CP} ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.tmp ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.err 
	@cat ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1360899539/LCDTerminal.o.ok; else exit 1; fi
	
${OBJECTDIR}/CODECAudio.o: CODECAudio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/CODECAudio.o.d 
	@${RM} ${OBJECTDIR}/CODECAudio.o.ok ${OBJECTDIR}/CODECAudio.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/CODECAudio.o.d -o ${OBJECTDIR}/CODECAudio.o CODECAudio.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/CODECAudio.o.d -o ${OBJECTDIR}/CODECAudio.o CODECAudio.c   2>&1  > ${OBJECTDIR}/CODECAudio.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/CODECAudio.o.ok ; fi 
	@touch ${OBJECTDIR}/CODECAudio.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/CODECAudio.o.d > ${OBJECTDIR}/CODECAudio.o.tmp
	@${RM} ${OBJECTDIR}/CODECAudio.o.d 
	@${CP} ${OBJECTDIR}/CODECAudio.o.tmp ${OBJECTDIR}/CODECAudio.o.d 
	@${RM} ${OBJECTDIR}/CODECAudio.o.tmp
endif
	@touch ${OBJECTDIR}/CODECAudio.o.err 
	@cat ${OBJECTDIR}/CODECAudio.o.err 
	@if [ -f ${OBJECTDIR}/CODECAudio.o.ok ] ; then rm -f ${OBJECTDIR}/CODECAudio.o.ok; else exit 1; fi
	
${OBJECTDIR}/AVIPlayer.o: AVIPlayer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/AVIPlayer.o.d 
	@${RM} ${OBJECTDIR}/AVIPlayer.o.ok ${OBJECTDIR}/AVIPlayer.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/AVIPlayer.o.d -o ${OBJECTDIR}/AVIPlayer.o AVIPlayer.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/AVIPlayer.o.d -o ${OBJECTDIR}/AVIPlayer.o AVIPlayer.c   2>&1  > ${OBJECTDIR}/AVIPlayer.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/AVIPlayer.o.ok ; fi 
	@touch ${OBJECTDIR}/AVIPlayer.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/AVIPlayer.o.d > ${OBJECTDIR}/AVIPlayer.o.tmp
	@${RM} ${OBJECTDIR}/AVIPlayer.o.d 
	@${CP} ${OBJECTDIR}/AVIPlayer.o.tmp ${OBJECTDIR}/AVIPlayer.o.d 
	@${RM} ${OBJECTDIR}/AVIPlayer.o.tmp
endif
	@touch ${OBJECTDIR}/AVIPlayer.o.err 
	@cat ${OBJECTDIR}/AVIPlayer.o.err 
	@if [ -f ${OBJECTDIR}/AVIPlayer.o.ok ] ; then rm -f ${OBJECTDIR}/AVIPlayer.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o: ../MMB/LCDTerminalFont.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360899539 
	@${RM} ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.ok ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.d -o ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o ../MMB/LCDTerminalFont.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.d -o ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o ../MMB/LCDTerminalFont.c   2>&1  > ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.d > ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.d 
	@${CP} ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.tmp ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.err 
	@cat ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1360899539/LCDTerminalFont.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/1713430119/Primitive.o: ../Microchip/Graphics/Primitive.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Primitive.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Primitive.o.ok ${OBJECTDIR}/_ext/1713430119/Primitive.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1713430119/Primitive.o.d -o ${OBJECTDIR}/_ext/1713430119/Primitive.o ../Microchip/Graphics/Primitive.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1713430119/Primitive.o.d -o ${OBJECTDIR}/_ext/1713430119/Primitive.o ../Microchip/Graphics/Primitive.c   2>&1  > ${OBJECTDIR}/_ext/1713430119/Primitive.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1713430119/Primitive.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/1713430119/Primitive.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1713430119/Primitive.o.d > ${OBJECTDIR}/_ext/1713430119/Primitive.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1713430119/Primitive.o.d 
	@${CP} ${OBJECTDIR}/_ext/1713430119/Primitive.o.tmp ${OBJECTDIR}/_ext/1713430119/Primitive.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Primitive.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1713430119/Primitive.o.err 
	@cat ${OBJECTDIR}/_ext/1713430119/Primitive.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1713430119/Primitive.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1713430119/Primitive.o.ok; else exit 1; fi
	
${OBJECTDIR}/FSIO.o: FSIO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/FSIO.o.d 
	@${RM} ${OBJECTDIR}/FSIO.o.ok ${OBJECTDIR}/FSIO.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/FSIO.o.d -o ${OBJECTDIR}/FSIO.o FSIO.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/FSIO.o.d -o ${OBJECTDIR}/FSIO.o FSIO.c   2>&1  > ${OBJECTDIR}/FSIO.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/FSIO.o.ok ; fi 
	@touch ${OBJECTDIR}/FSIO.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/FSIO.o.d > ${OBJECTDIR}/FSIO.o.tmp
	@${RM} ${OBJECTDIR}/FSIO.o.d 
	@${CP} ${OBJECTDIR}/FSIO.o.tmp ${OBJECTDIR}/FSIO.o.d 
	@${RM} ${OBJECTDIR}/FSIO.o.tmp
endif
	@touch ${OBJECTDIR}/FSIO.o.err 
	@cat ${OBJECTDIR}/FSIO.o.err 
	@if [ -f ${OBJECTDIR}/FSIO.o.ok ] ; then rm -f ${OBJECTDIR}/FSIO.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/1360899539/MMB.o: ../MMB/MMB.C  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360899539 
	@${RM} ${OBJECTDIR}/_ext/1360899539/MMB.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360899539/MMB.o.ok ${OBJECTDIR}/_ext/1360899539/MMB.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1360899539/MMB.o.d -o ${OBJECTDIR}/_ext/1360899539/MMB.o ../MMB/MMB.C  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1360899539/MMB.o.d -o ${OBJECTDIR}/_ext/1360899539/MMB.o ../MMB/MMB.C   2>&1  > ${OBJECTDIR}/_ext/1360899539/MMB.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1360899539/MMB.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/1360899539/MMB.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1360899539/MMB.o.d > ${OBJECTDIR}/_ext/1360899539/MMB.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1360899539/MMB.o.d 
	@${CP} ${OBJECTDIR}/_ext/1360899539/MMB.o.tmp ${OBJECTDIR}/_ext/1360899539/MMB.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360899539/MMB.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1360899539/MMB.o.err 
	@cat ${OBJECTDIR}/_ext/1360899539/MMB.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1360899539/MMB.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1360899539/MMB.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/1713430119/DisplayDriver.o: ../Microchip/Graphics/DisplayDriver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.ok ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.d -o ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o ../Microchip/Graphics/DisplayDriver.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.d -o ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o ../Microchip/Graphics/DisplayDriver.c   2>&1  > ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.d > ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.d 
	@${CP} ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.tmp ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.err 
	@cat ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1713430119/DisplayDriver.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/1575306571/gfxpmp.o: ../Microchip/Graphics/Drivers/gfxpmp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.ok ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.d -o ${OBJECTDIR}/_ext/1575306571/gfxpmp.o ../Microchip/Graphics/Drivers/gfxpmp.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.d -o ${OBJECTDIR}/_ext/1575306571/gfxpmp.o ../Microchip/Graphics/Drivers/gfxpmp.c   2>&1  > ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.d > ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.d 
	@${CP} ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.tmp ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.err 
	@cat ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1575306571/gfxpmp.o.ok; else exit 1; fi
	
${OBJECTDIR}/SD-SPI.o: SD-SPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/SD-SPI.o.d 
	@${RM} ${OBJECTDIR}/SD-SPI.o.ok ${OBJECTDIR}/SD-SPI.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/SD-SPI.o.d -o ${OBJECTDIR}/SD-SPI.o SD-SPI.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"../MMB" -I"../Microchip/Include" -I"../Microchip/Include/MDD File System" -I"." -I"." -I"." -I"." -MMD -MF ${OBJECTDIR}/SD-SPI.o.d -o ${OBJECTDIR}/SD-SPI.o SD-SPI.c   2>&1  > ${OBJECTDIR}/SD-SPI.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/SD-SPI.o.ok ; fi 
	@touch ${OBJECTDIR}/SD-SPI.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/SD-SPI.o.d > ${OBJECTDIR}/SD-SPI.o.tmp
	@${RM} ${OBJECTDIR}/SD-SPI.o.d 
	@${CP} ${OBJECTDIR}/SD-SPI.o.tmp ${OBJECTDIR}/SD-SPI.o.d 
	@${RM} ${OBJECTDIR}/SD-SPI.o.tmp
endif
	@touch ${OBJECTDIR}/SD-SPI.o.err 
	@cat ${OBJECTDIR}/SD-SPI.o.err 
	@if [ -f ${OBJECTDIR}/SD-SPI.o.ok ] ; then rm -f ${OBJECTDIR}/SD-SPI.o.ok; else exit 1; fi
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/AVIPlayer.${IMAGE_TYPE}.elf: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_ICD3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/AVIPlayer.${IMAGE_TYPE}.elf ${OBJECTFILES}        -Wl,--defsym=__MPLAB_BUILD=1,--report-mem$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__ICD2RAM=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,--defsym=_min_heap_size=4096,--defsym=_min_stack_size=1024,-L".",-Map="${DISTDIR}/AVIPlayer.${IMAGE_TYPE}.map" 
else
dist/${CND_CONF}/${IMAGE_TYPE}/AVIPlayer.${IMAGE_TYPE}.elf: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/AVIPlayer.${IMAGE_TYPE}.elf ${OBJECTFILES}        -Wl,--defsym=__MPLAB_BUILD=1,--report-mem$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=4096,--defsym=_min_stack_size=1024,-L".",-Map="${DISTDIR}/AVIPlayer.${IMAGE_TYPE}.map"
	${MP_CC_DIR}\\pic32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/AVIPlayer.${IMAGE_TYPE}.elf  
endif


# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf:
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
