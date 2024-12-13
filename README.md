### **Objective**

Beast CRM needs the posiblity of integrating a full implementation of Whatsapp API so the user can link how many Whatsapp API Business accounts as he wants.
REF: [Whatsapp API Meta docs](https://developers.facebook.com/docs/whatsapp)

Detail: Access to the WhatsApp Business API is limited to companies and in no way dedicated to individuals.
Useful reference:
https://www.callbell.eu/en/whatsapp-api-everything-you-need-to-know/
https://www.loom.com/share/53f463d0a5d54171b6290ccc72efa751

<hr>

### **User Personas**

Primary Persona: Tom, the CEO of X company
Secondary Persona (if any): John, Customer Service Employee

<hr>

### **User Journey**

**Preconditions**

- User must be SUDO in order to create/link a session.
- The user has to have the implementation type available in current_user.allowed_sessions_kind (or allowed_sessions_type) (TBI)
- The number of sessions + the new session has to be less than current_user.allowed_sessions_count (TBI) + current_user.sessions.count

**Steps in the Journey**

_Scenario 1_

- Tom goes to the sessions page, clicks the "Add new session" button. Selects the type of session it wants to connect.
- A Meta oAuth configuration modal will popup and present the user with a step by step process.
- Tom will go through the meta process of verification in the Frontend selecting his business manager and the cellphone he wants to use (Check loom video reference)
- After Meta connects succesfully the backend will get a post with all the information and create the session, linking it to the Agency Tom owns.
- In case of failure the Backend will return the pertinent error messages and the Frontend will take care of showing them and the session will not be created.

- If the Session Creation is succesful, from that moment forward the user will receieve all the Messages that come from that integration in the first funnel of the agency.
  Each new message that comes from the Meta API will find_or_create_by a Chat.
  Each Chat will contain one or multiple messages.
  This has to be in real time (Meta provides Webhooks, use them).

- Now, John, Tom's employee will have the possibility of seing the chats that belong to the Session.

_Scenario 2_

- John will be waiting in the "funnels" page waiting for a new message to drop inside the CRM.
- Once a new message arrives, John has the possibility of answering to said message and it will be assigned to that chat as the Chat.agent.
- John should be able to send all supported messages (multimedia, text, audio, etc)

Postconditions
When the user sends a message, the integration should simulate that the user is typing.

Example of the current Whatsapp Integration
`const calculateMessageDelay = (message) => {
  const typingSpeed = 13; // Average typing speed in ms per character
  const randomExtraDelay = Math.random() * 1000; // Random extra delay between 0 and 1000ms
  return message.length * typingSpeed + randomExtraDelay;
};`

<hr>

### **Functional Requirements**

- All new chats will be checked as new with the following criteria Chat.find_or_create_by(session_id, agency_id, contact_id( or contact_number))
- This feature should be active all the time. (Meaning messages should arrive even if the CRM is closed)
- The messages shoulld be real-time.
- Must be efficient and compatible with all other integrations.
- Please keep everything separated into controllers, models and graphql mutations/queries/subscriptions.
- Use the chat_updated subscription to notify the frontend of a new chat. (This is already implemented in the Chat model but just in case.)
- New chats should have profile picture

### **Acceptance Criteria**

- Feature should be delivered with all functionallity complete and working. Testing is adviced, not required.
- Documentation on how the feature is design is a MUST.
- Please don't leave any other language comments in the code (Or at least leave the equivalent in English).
- A PR should be pointed to the Dev branch whenever the feature is finished and notified to the owner of the project.

Dependencies
https://developers.facebook.com/docs/whatsapp

Risks & Concerns

Risk 1: Third-party API may have rate limits.
Risk 2: Third-party API may have specific requirements. Let me know. The approved Business Managers are not required until the app is pubblished, you can integrate before having them.

### **Objective**

Beast CRM needs the posiblity of integrating a full implementation of Instagram API so the user can link how many Instagram API Business accounts as he wants.
REF: [https://developers.facebook.com/docs/messenger-platform/](Instagram API Meta docs)

Detail: Access to the Instagram API is limited to Instagram commercial accounts and in no way dedicated to individuals.
Useful reference:
https://callbellsupport.zendesk.com/hc/es/articles/4402150776977-Instagram-Direct-Integrar-Instagram-Direct-a-Callbell-requisitos-obligatorios
https://callbellsupport.zendesk.com/hc/es/articles/4402156930193-Instagram-Direct-C%C3%B3mo-integrar-Instagram-Direct-a-Callbell

<hr>

### **User Personas**

Primary Persona: Tom, the CEO of X company
Secondary Persona (if any): John, Customer Service Employee

<hr>

### **User Journey**

**Preconditions**

- User must be SUDO in order to create/link a session.
- The user has to have the implementation type available in current_user.allowed_sessions_kind (or allowed_sessions_type) (TBI)
- The number of sessions + the new session has to be less than current_user.allowed_sessions_count (TBI) + current_user.sessions.count

**Steps in the Journey**

_Scenario 1_

- Tom goes to the sessions page, clicks the "Add new session" button. Selects the type of session it wants to connect.
- A Meta oAuth configuration modal will popup and present the user with a step by step process.
- Tom will go through the Meta process of verification in the Frontend selecting his Instagram business account.
- After Meta connects succesfully the backend will get a post with all the information and create the session, linking it to the Agency Tom owns.
- In case of failure the Backend will return the pertinent error messages and the Frontend will take care of showing them and the session will not be created.

- If the Session Creation is succesful, from that moment forward the user will receieve all the Messages that come from that integration in the first funnel of the agency.
  Each new message that comes from the Meta API will find_or_create_by a Chat.
  Each Chat will contain one or multiple messages.
  This has to be in real time (Meta provides Webhooks, use them).

- Now, John, Tom's employee will have the possibility of seing the chats that belong to the Session.

_Scenario 2_

- John will be waiting in the "funnels" page waiting for a new message to drop inside the CRM.
- Once a new message arrives, John has the possibility of answering to said message and it will be assigned to that chat as the Chat.agent.
- John should be able to send all supported messages (multimedia, text, audio, etc)

Postconditions
When the user sends a message, the integration should simulate that the user is typing.

Example of the current Whatsapp Integration
`const calculateMessageDelay = (message) => {
  const typingSpeed = 13; // Average typing speed in ms per character
  const randomExtraDelay = Math.random() * 1000; // Random extra delay between 0 and 1000ms
  return message.length * typingSpeed + randomExtraDelay;
};`

<hr>

### **Functional Requirements**

- All new chats will be checked as new with the following criteria Chat.find_or_create_by(session_id, agency_id, contact_id( or contact_number))
- This feature should be active all the time. (Meaning messages should arrive even if the CRM is closed)
- The messages shoulld be real-time.
- Must be efficient and compatible with all other integrations.
- Please keep everything separated into controllers, models and graphql mutations/queries/subscriptions.
- Use the chat_updated subscription to notify the frontend of a new chat. (This is already implemented in the Chat model but just in case.)
- New chats profile pic.

### **Acceptance Criteria**

- Feature should be delivered with all functionallity complete and working. Testing is adviced, not required.
- Documentation on how the feature is design is a MUST.
- Please don't leave any other language comments in the code (Or at least leave the equivalent in English).
- A PR should be pointed to the Dev branch whenever the feature is finished and notified to the owner of the project.

Dependencies
https://developers.facebook.com/docs/messenger-platform

Risks & Concerns

Risk 1: Third-party API may have rate limits.
Risk 2: Third-party API may have specific requirements. Let me know. The approved Business Managers are not required until the app is pubblished, you can integrate before having them.

### **Objective**

Beast CRM needs the posiblity of integrating a full implementation of Whatsapp API so the user can link how many Facebook API Business accounts as he wants.
REF: [https://developers.facebook.com/docs/messenger-platform/](Facebook API Meta docs)

Detail: Access to the Facebook API is limited to Facebook commercial accounts and in no way dedicated to individuals.
Useful reference:
https://callbellsupport.zendesk.com/hc/es/articles/4402150776977-Instagram-Direct-Integrar-Instagram-Direct-a-Callbell-requisitos-obligatorios
https://callbellsupport.zendesk.com/hc/es/articles/4402156930193-Instagram-Direct-C%C3%B3mo-integrar-Instagram-Direct-a-Callbell

<hr>

### **User Personas**

Primary Persona: Tom, the CEO of X company
Secondary Persona (if any): John, Customer Service Employee

<hr>

### **User Journey**

**Preconditions**

- User must be SUDO in order to create/link a session.
- The user has to have the implementation type available in current_user.allowed_sessions_kind (or allowed_sessions_type) (TBI)
- The number of sessions + the new session has to be less than current_user.allowed_sessions_count (TBI) + current_user.sessions.count

**Steps in the Journey**

_Scenario 1_

- Tom goes to the sessions page, clicks the "Add new session" button. Selects the type of session it wants to connect.
- A Meta oAuth configuration modal will popup and present the user with a step by step process.
- Tom will go through the Meta process of verification in the Frontend selecting his Instagram business account.
- After Meta connects succesfully the backend will get a post with all the information and create the session, linking it to the Agency Tom owns.
- In case of failure the Backend will return the pertinent error messages and the Frontend will take care of showing them and the session will not be created.

- If the Session Creation is succesful, from that moment forward the user will receieve all the Messages that come from that integration in the first funnel of the agency.
  Each new message that comes from the Meta API will find_or_create_by a Chat.
  Each Chat will contain one or multiple messages.
  This has to be in real time (Meta provides Webhooks, use them).

- Now, John, Tom's employee will have the possibility of seing the chats that belong to the Session.

_Scenario 2_

- John will be waiting in the "funnels" page waiting for a new message to drop inside the CRM.
- Once a new message arrives, John has the possibility of answering to said message and it will be assigned to that chat as the Chat.agent.
- John should be able to send all supported messages (multimedia, text, audio, etc)

Postconditions
When the user sends a message, the integration should simulate that the user is typing.

Example of the current Whatsapp Integration
`const calculateMessageDelay = (message) => {
  const typingSpeed = 13; // Average typing speed in ms per character
  const randomExtraDelay = Math.random() * 1000; // Random extra delay between 0 and 1000ms
  return message.length * typingSpeed + randomExtraDelay;
};`

<hr>

### **Functional Requirements**

- All new chats will be checked as new with the following criteria Chat.find_or_create_by(session_id, agency_id, contact_id( or contact_number))
- This feature should be active all the time. (Meaning messages should arrive even if the CRM is closed)
- The messages shoulld be real-time.
- Must be efficient and compatible with all other integrations.
- Please keep everything separated into controllers, models and graphql mutations/queries/subscriptions.
- Use the chat_updated subscription to notify the frontend of a new chat. (This is already implemented in the Chat model but just in case.)
- New chats profile pic.

### **Acceptance Criteria**

- Feature should be delivered with all functionallity complete and working. Testing is adviced, not required.
- Documentation on how the feature is design is a MUST.
- Please don't leave any other language comments in the code (Or at least leave the equivalent in English).
- A PR should be pointed to the Dev branch whenever the feature is finished and notified to the owner of the project.

Dependencies
https://developers.facebook.com/docs/messenger-platform

Risks & Concerns

Risk 1: Third-party API may have rate limits.
Risk 2: Third-party API may have specific requirements. Let me know. The approved Business Managers are not required until the app is pubblished, you can integrate before having them.

### **Objective**

Beast CRM needs the posiblity of integrating a full implementation of Telegram API so the user can link how many Telegram API accounts as he wants.
REF: [https://core.telegram.org/#bot-api](Here you can use TDLib or the bots API)

Useful reference:
https://callbellsupport.zendesk.com/hc/es/articles/360012759197-Telegram-C%C3%B3mo-integrar-Telegram-a-Callbell
https://callbellsupport.zendesk.com/hc/es/articles/360012860658-Telegram-C%C3%B3mo-personalizar-tu-perfil-de-Telegram-bot
https://t.me/botfather

<hr>

### **User Personas**

Primary Persona: Tom, the CEO of X company
Secondary Persona (if any): John, Customer Service Employee

<hr>

### **User Journey**

**Preconditions**

- User must be SUDO in order to create/link a session.
- The user has to have the implementation type available in current_user.allowed_sessions_kind (or allowed_sessions_type) (TBI)
- The number of sessions + the new session has to be less than current_user.allowed_sessions_count (TBI) + current_user.sessions.count

**Steps in the Journey**

_Scenario 1_

- Tom goes to the sessions page, clicks the "Add new session" button. Selects the type of session it wants to connect.
- Tom will add the needed configuration in the frontend (token and name of bot probably).
- After Telegram sends the verefication code and Tome sends it to the backend, it post with all the information and create the session, linking it to the Agency Tom owns.
- In case of failure the Backend will return the pertinent error messages and the Frontend will take care of showing them and the session will not be created.

- If the Session Creation is succesful, from that moment forward the user will receieve all the Messages that come from that integration in the first funnel of the agency.
  Each new message that comes from the Meta API will find_or_create_by a Chat.
  Each Chat will contain one or multiple messages.
  This has to be in real time

- Now, John, Tom's employee will have the possibility of seing the chats that belong to the Session.

_Scenario 2_

- John will be waiting in the "funnels" page waiting for a new message to drop inside the CRM.
- Once a new message arrives, John has the possibility of answering to said message and it will be assigned to that chat as the Chat.agent.
- John should be able to send all supported messages (multimedia, text, audio, etc)

Postconditions
When the user sends a message, the integration should simulate that the user is typing.

Example of the current Whatsapp Integration
`const calculateMessageDelay = (message) => {
  const typingSpeed = 13; // Average typing speed in ms per character
  const randomExtraDelay = Math.random() * 1000; // Random extra delay between 0 and 1000ms
  return message.length * typingSpeed + randomExtraDelay;
};`

<hr>

### **Functional Requirements**

- All new chats will be checked as new with the following criteria Chat.find_or_create_by(session_id, agency_id, contact_id( or contact_number))
- This feature should be active all the time. (Meaning messages should arrive even if the CRM is closed)
- The messages shoulld be real-time.
- Must be efficient and compatible with all other integrations.
- Please keep everything separated into controllers, models and graphql mutations/queries/subscriptions.
- Use the chat_updated subscription to notify the frontend of a new chat. (This is already implemented in the Chat model but just in case.)
- New chats profile pic.

### **Acceptance Criteria**

- Feature should be delivered with all functionallity complete and working. Testing is adviced, not required.
- Documentation on how the feature is design is a MUST.
- Please don't leave any other language comments in the code (Or at least leave the equivalent in English).
- A PR should be pointed to the Dev branch whenever the feature is finished and notified to the owner of the project.

Dependencies
https://core.telegram.org/#bot-api

Risks & Concerns

Risk 1: Third-party API may have rate limits.
Risk 2: Third-party API may have specific requirements. Let me know.

### **Objective**

Beast CRM needs a calendar system that let the client book meetings with clients. Have notifications off when they're happening, and reminders. And be able to go to a meeting when the meeting is booked.

Reference:
https://www.youtube.com/shorts/OOyqHJkp_qU

<hr>

### **User Personas**

Primary Persona: Tom, the CEO of X company
Secondary Persona (if any): John, Customer Service Employee

<hr>

### **User Journey**

**Preconditions**

- User can book a meeting with existing Clients and assigned them to a User (him or another one)
- User has to be able to fetch all the meetings that he has assigned (and be able to filter by date and client)
- Chat will have a status if they have a meeting today.
- **Steps in the Journey**

_Scenario 1_

- John receieves a message from a new lead.
- The lead (Chat/Contact) wants to know more about X product so he want to book a meeting.
- John adds a new event to the Chat assigning the date, a brief description and has the possibility of adding a new google meet with it.
- When John creates this new event it should send a message to the lead with the information of the new meeting.
- The data of the meeting should be stored in the connected google account (or whatever Third party service we use) TBD

_Scenario 2_

- John enters to the dashboard of the CRM and checks what meetings he has today, tomorrow or this week (Just a filter by from and to date).
- John can filter in a per-client basis

Postconditions
To create an event there has to be a Chat present.

<hr>

### **Functional Requirements**

- The user should be able to create events in every chat.
- One chat can have multiple events attached to it.
- Events should allow filtering by date, client and status.

### **Acceptance Criteria**

- Feature should be delivered with all functionallity complete and working. Testing is adviced, not required.
- Documentation on how the feature is design is a MUST.
- Please don't leave any other language comments in the code (Or at least leave the equivalent in English).
- A PR should be pointed to the Dev branch whenever the feature is finished and notified to the owner of the project.

Dependencies

- To be discused

Risks & Concerns

Risk 1: Third-party API may have rate limits.
Risk 2: Third-party API may have specific requirements. Let me know.

### **Objective**

Beast CRM needs a payment system to be able to process payments and subscriptions.

Reference:
![image](https://github.com/user-attachments/assets/23b50c36-362f-40bc-ac8d-b34a839bd5a9)

<hr>

### **User Personas**

Primary Persona: Tom, the CEO of X company
Secondary Persona (if any): John, Customer Service Employee

<hr>

### **User Journey**

**Preconditions**

- Users can pay for a subscription directly on the page
- Payment system have to be embedded
- Payment system has to be agnostic to any payment processor

**Steps in the Journey**

_Scenario 1_

- Tom wants to aquire a new CRM for his company.
- He goes to Beast CRM website and chooses one of 3 options:
- Basic plan, Pro plan, Custom Plan (Each plan will have monthly, six months and yearly)
- He chooses a plan and proceeds to fill his company information to create an agency and a user.
- Once the user is created, the plan will give access to the specific features he has available.

Postconditions

- The plans have to notify the user when they're about to expire.

<hr>

### **Functional Requirements**

- The user should be able to do all the creation of the agency/user on his own.
- Each plan needs to have a configurable set of parameters (this parameters will be only configurable by Beast CRM)
- Parameters open to configuration: Users, Amount of Sessions per Type, Type of Sessions, Discount, Features available.

### **Acceptance Criteria**

- Feature should be delivered with all functionallity complete and working. Testing is adviced, not required.
- Documentation on how the feature is design is a MUST.
- Please don't leave any other language comments in the code (Or at least leave the equivalent in English).
- A PR should be pointed to the Dev branch whenever the feature is finished and notified to the owner of the project.
- The number of sessions/users can be increased at a cost at any time, so the user will be able to pay for more sessions independent to the current plan they have.
- The user should be able to change the type of integration that he wants to use.

Dependencies

- To be discused

Risks & Concerns

Risk 1: Third-party API may have rate limits.
Risk 2: Third-party API may have specific requirements. Let me know.

### **Objective**

Beast CRM clients need to keep track of the statistics of their costumers! We need an endpoint that would provide comprenhesive data and statistics.

Reference:
![image](https://github.com/user-attachments/assets/27fb3af3-bc5a-4d52-8343-e351995196d1)

<hr>

### **User Personas**

Primary Persona: Tom, the CEO of X company
Secondary Persona (if any): John, Customer Service Employee

<hr>

### **User Journey**

**Preconditions**

- X company has chats
- X company has access to dashboard
- User has to be sudo

**Steps in the Journey**

_Scenario 1_

- Tom wants to check the statistics of their team.
- He goes to the dashboard.
- Statistics that are filterable by date, date periods and customers are displayed in a timely and fast manner.

<hr>

### **Functional Requirements**

- The user has to see the statistics that regard to their sessions.
- Stats are in Agency level. (Meaning all data availabe to current_user.selected_agency has to be taken into account)
- Stats to be displayed are as follows (Array of objects per day):

* Count of chats per tag.
* Count of new chats per day.
* Avearge time of response per agent (average of the difference between customer message and user response)
* Median time of response per agent (median of the difference between customer message and user response)
* Avearge time of response (all agents combined) (average of the difference between customer message and user response)
* Median time of response (all agents combined) (median of the difference between customer message and user response)
* Count of new chats per day per session.
* Count of new messages per day per session.
* Sum of chats answered per agent.
* Customers with the most interaction (1 interaction = new message after 1 hour of last message)
* Amount of active Customers (At least 1 message in the las week)

### **Acceptance Criteria**

- Feature should be delivered with all functionallity complete and working. Testing is adviced, not required.
- Documentation on how the feature is design is a MUST.
- Please don't leave any other language comments in the code (Or at least leave the equivalent in English).
- A PR should be pointed to the Dev branch whenever the feature is finished and notified to the owner of the project.

Dependencies

- To be discused
