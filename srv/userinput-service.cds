using { fourth_cap_service as my } from '../db/userdetails';

service MyService1 {

  entity Userdet as projection on my.Userdet;
}