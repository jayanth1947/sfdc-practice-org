trigger leadTrigger on Lead (before insert) {

    System.debug('This trigger is executed successsfuly');
}