# Access to health data at UCLH

<!-- for comments that won't appear online -->

Contents

[Five Safes at UCLH overview](#five-safes-at-uclh-overview)   
[Safe people](#safe-people)  
[Safe projects](#safe-projects)    
   - [UCL UCLH Joint Research Office checklist](#ucl-uclh-joint-research-office-checklist)    
[Safe settings](#safe-settings)    
[Safe outputs](#safe-outputs)   
[Safe data](#safe-data)   
[Data access checklist](#data-access-checklist)

## Five Safes at UCLH overview

Data access at UCLH is judged using the '[5
safes](https://www.youtube.com/watch?v=Mln9T52mwj0)'
framework. This summarises our local implementation.

**Safe people**

-   all individuals have substantive contracts or educational
    relationships with higher education or NHS institutions

-   those working need to have evidence of experience of working with
    such data (e.g. previous training, previous work with ONS, data safe
    havens etc.) or they need a supervisor who can has similar
    experience

-   those working need to undergo training in information governance and
    issues with statistical disclosure control (SDC)

**Safe projects**

-   projects must serve the public good

-   projects must meet relevant HRA and UCLH research and ethics
    approvals

-   service delivery work mandated as per usual trust processes

**Safe settings**

-   working at UCLH in the NHS on approved infrastructure

    -   UCLH local and remote desktops

    -   UCLH Data Science Desktop

    -   EMAP

**Safe outputs**

-   outputs (e.g. reports, figures and tables) must be non-disclosing

-   outputs should remain on NHS systems initially

-   a copy of all outputs that are released externally (documents)
    should be stored in one central location so that there is visibility
    for all

**Safe data**

-   direct identifiers (hospital numbers, NHS numbers, names etc) should
    be masked unless there is an explicit justification for their use

-   data releases are proportionate (e.g. limited by calendar periods,
    by patient cohort etc.)

-   further work to obscure or mask the data is not necessary given the
    other safe guards (as per the recommendation by the UK data service)
   
We will now give more details for each of the 5 safes.   
    
## Safe people

We suggest you measure yourself against the following criteria. 
When you are ready, then please [submit your evidence here](https://forms.office.com/Pages/DesignPage.aspx#FormId=_oivH5ipW0yTySEKEdmlwhXzC51z3xxEpmhpTardTsFUQzVIS1lGVldUTzVFOEo3VlBYQTNZWUxYMy4u)

### Your role
A user should either
*	Hold an Honorary or Substantive contract with UCLH
*	[An NHS research passport or a letter of access](https://www.ucl.ac.uk/joint-research-office/sites/joint-research-office/files/jro_sop_7_-_jro_administration_of_research_passports_v4_13.11.2019_clean.pdf) 

### Your technical skills
A user should either 
*	hold a clinical qualification (in medicine, nursing, or the allied health professions) and have demonstrable experience in the management and analysis of health care data
*	or hold a relevant undergraduate degree (or higher) in a field of study using quantitative data
*	or be able to demonstrate at least three years quantitative research, audit or business intelligence experience
*	or have a named supervisor who meets the above criteria and confirms sufficient time to support the user

### Your training
A user should demonstrate **all** of the following
1.	Current information governance training
  *	UCLH mandatory IG training certificate
  *	or the [MRC’s Research, GDPR and confidentiality training](https://byglearning.co.uk/mrcrsc-lms/course/index.php?categoryid=1) certificate 
1.	Good Clinical Practice training
  * [UCL/UCLH JRO face-to-face training](https://www.eventbrite.co.uk/o/joint-research-office-3034703256)
  * or [NIHR online training](https://sites.google.com/a/nihr.ac.uk/crn-learn-help/accessing-nihr-learn) (free)
  
### Your [microdata](https://en.wikipedia.org/wiki/Microdata_(statistics)) experience
A user should demonstrate one of the following
1. Demonstrable experience using microdata. Suggested supporting evidence would include:
   * the microdata used (e.g. ONS list cleaning, EHRS queries on Caboodle/Clarity)
   * the source of the microdata (e.g. UCLH)
   * the project 
   * your role in the project (e.g. analyst, Chief Investigator)
   * statistical techniques used
   * measures used to protect confidentiality (e.g. examples of statistical disclosure control)
   * statistical or development software used
   * Completed assessments from the [Data access training]() module derived from material provided by the Safe Data Access Professionals Working Group 
Microdata is information at the level of individual. All data derived from an electronic health record is by definition microdata unless later aggregated. 

## Safe projects

We have adopted and adapted the ONS Data Ethics Advisory Committee's application form.

<!-- note link to appliaction form from earlier version is no longer working -->
<!-- [application
form](https://www.statisticsauthority.gov.uk/wp-content/uploads/2019/10/DEA_Research_Project_Application_v1.2.docx)  -->

Where you have an existing IRAS form, we have indicated the sections
that can be directly copy-and-pasted into this application.


The UCLH version [can be downloaded here](https://github.com/uclh-criu/learning-datascience/blob/master/documents/five-safes/CRIU Research Project Application.docx).


The project application headings are summarised below

1.  **Application Type: Research or Exploratory analysis**
    *Most applications will require formal research approval, but there
    are circumstances where the work will be exploratory. This will need
    to be justified to the UCLH data access committee.*

2.  **Project Lead**
    *Name and details with comment on whether the lead will also view
    the data or just the derived outputs*

3.  **Researcher Team**
    *Name and details of all members plus guidance as to whom the
    project lead is deputising*

4.  **Research Sponsor**
    *Have you been commissioned to perform this research for another
    organisation?*

5.  **Title of the research project**
    And estimated duration of the project

6.  **Abstract of the research project**
    *Include a short description of the project and its benefits, in no
    more than 100 words.*
    *or* IRAS Section A6-1 "Summary of the study" (300 words)

7.  **Purpose of Research Project**
    *Provide a detailed description of the purpose for which the data
    are requested, describing the aims of the study/research in no more
    than 500 words. Where research is part of a larger programme please
    include details below.*
    *or* IRAS Section A12. "What is the scientific justification for the
    research?"

8.  **Research Methodology**
    *Provide details of the research protocol or methodology (e.g. data
    linkage or matching, statistical modelling etc) and how you intend
    to use the data, in no more than 1000 words.*
    *or* IRAS Section A13. "Please give a full summary of your design
    and methodology"

9.  **Data Required**

    1.  *List the data sources, the patient cohorts and the timer
        periods you wish to examine. Give as much detail as possible on
        the exact data items you require.*

    2.  *Describe what portions of the data **will** be or **might** be
        identifiable using the framework below. For example, you might
        require hospital number to link to other data items (a direct
        identifier). However, you might also require date of birth to
        define age, this might be an identifying with other
        information.*

        1.  **Direct identifiers**
            e.g. names, NHS number, hospital number etc.

        2.  **Indirect identifiers**
            e.g. date of birth, diagnosis, the first 3 letters of a
            postcode etc.

        3.  **Non-identifying variables**
            e.g. heart rate, creatinine, urine volume

        4.  **Free text**
            Where under normal circumstances de-identification is not
            guaranteed

    3.  Other data sources
        *If you intend to bring in any data for your project, give
        details of the data including who the owner is and provide
        evidence that the owner has given permission for their data to
        be used by you for this research.*

    4.  Justification for access to this rather than existing or public
        data
        *Explain why access to legally protected (unpublished) data is
        needed. Please state what other data sources have been
        considered and why they are not sufficient for your purposes.*

10. **Data linkage**
    *Does your project include any linking of data sources (as defined
    within the application guidance)? If yes, provide the following
    details below:*
    - *description of the data sources(s) to be linked*
    - *summary of the key variables;*
    - *summary of the linking methodology; and*
    - *the justification for the linking.*

11. **Ethics**
    *You will need to provide evidence of an ethics consideration for
    your research project.*
    *Have you had ethical approval for this project from your
    organisation or elsewhere?*

12. **Public Good**

    5.  *Please describe how your research project will provide a public
        good.*
        *Complete all the sections that apply (e.g.* Provide an evidence
        base for health care including direct patient or health system
        benefit)

    6.  *Have any risks to public benefit been identified? What are they
        and how have they been mitigated?*

13. **Duration of access**
    *What is your best estimate of the last time you will need access to
    the unpublished data?*
    *Note: if applying for exploratory analysis, access will be granted
    for a maximum of 12 months*

14. **Publications**
    *In order to access unpublished data for research purposes, you must
    promise* *that your findings will be made* *publicly available.*
    *Exemptions may only be granted in exceptional circumstances.*
    *Note: If you are applying for exploratory analysis, no publications
    are permitted.*
    - *How do you intend to make your research available to the
    public?*
    - *Which specific journals, websites or reports do you intend to use
    to publish this research?*
    - *What is your best estimate of the project publication date.*
    ***-** What, if any, are the circumstances that mean you need an
    exemption from making your results publicly available?*
    *or* IRAS Section A51. "How do you intend to report and disseminate
    the results of the study"


### UCL UCLH Joint Research Office checklist

[Starting a new
study](https://www.ucl.ac.uk/joint-research-office/starting-new-study)\
There are typically three stages of approval that must be considered
before conducting clinical research:

-   [Sponsorship and
    funding](https://www.ucl.ac.uk/joint-research-office/conduct-study/sponsorship-and-funding)

    -   Evidence of peer review

        -   [Flow
            diagram](https://www.ucl.ac.uk/joint-research-office/sites/joint-research-office/files/guidance_for_researchers_-_jro_peer_review_requirements_v2.0_06.04.2020.pdf)

        -   [SOP](https://www.ucl.ac.uk/joint-research-office/sites/joint-research-office/files/jro_sop_15_peer_review_for_studies_sponsored_by_ucl_and_uclh_v2_06042020_final.pdf)

    -   Draft protocol for an [observational study on a JRO
        template](https://www.ucl.ac.uk/joint-research-office/sites/joint-research-office/files/JRO_UCLUCLH_Observational_Protocol_Template_-_version_1_17-08-2015.docx)

    -   [Draft IRAS form](https://www.myresearchproject.org.uk/)

    -   Applicable draft participant documents (where patients are being
        consented)

        -   Participant Information Sheet

        -   Consent forms

        -   GP letters

    -   [Details of any statistical
        engagement](https://www.ucl.ac.uk/joint-research-office/new-studies/biostatistics-group)

    -   CV of the Chief Investigator ([HRA
        template](https://www.hra.nhs.uk/documents/1010/guidance_on_submission_of_cv1_3sIWGet.doc))

    -   Draft [Organisation Information
        Document](https://myresearchproject.org.uk/help/help%20documents/Organisation_Information_Document__Data-Processing_v1-1.docx)
        and [Schedule
        Of Events](https://www.nihr.ac.uk/researchers/collaborations-services-and-support-for-your-research/run-your-study/excess-treatment-costs.htm)

    -   Evidence of funding (where applicable)

    -   Details of any collaborations with external parties, including
        commercial entities and suppliers

    -   Any conflicts of interest

-   [Regulatory
    Approvals](https://www.ucl.ac.uk/joint-research-office/conduct-study/regulatory-approvals-)

    -   Research Ethics

    -   GDPR

        -   [HRA
            guidance](https://www.hra.nhs.uk/planning-and-improving-research/policies-standards-legislation/data-protection-and-information-governance/gdpr-guidance/what-you-need-do/transparency/)

        -   [UCLH transparency
            checklist](https://www.ucl.ac.uk/joint-research-office/sites/joint-research-office/files/transparency_checklist.docx)

    -   HRA

        -   Complete a research application form on the [Integrated
            Research Application System
            (IRAS)](http://www.myresearchproject.org.uk/)

        -   [Prepare your study
            documents](https://www.hra.nhs.uk/planning-and-improving-research/research-planning/prepare-study-documentation/)

        -   Book your application in through the [Online Booking
            Service](https://www.hra.nhs.uk/about-us/committees-and-services/online-booking-service/)

        -   E-submit your [applications in
            IRAS.](https://www.myresearchproject.org.uk/)

-   UCLH feasibility (aka [NHS Site Assess, Arrange and
    Confirm](https://www.ucl.ac.uk/joint-research-office/new-studies/assess-arrange-and-confirm))

    -   Checks

        -   [General feasibility
            assessment](http://www.hra.nhs.uk/resources/hra-approval-nhs-organisation-guidance/#NHS) as
            required by the HRA 

        -   Clinical director authorisation 

        -   Finance review to ensure costs are identified and covered

        -   Where required, a Contract review and negotiation

        -   [Honorary research contracts or Letters of
            Access](https://www.ucl.ac.uk/joint-research-office/sites/joint-research-office/files/jro_sop_7_-_jro_administration_of_research_passports_v4_13.11.2019_clean.pdf) where
            required for non-UCLH researchers to carry out research
            activity on site.\
            Please contact the JRO on <uclh.jro-communications@nhs.net>

    -   Core documents

        -   Copy of IRAS Form (combined REC and R&D form) as submitted
            for HRA Approval Protocol

        -   Any substantial or non-substantial amendments

        -   Participant information and consent documents

        -   Statement of Activities relevant to the participating NHS
            organisation (non-commercially sponsored only) or delegation
            log (commercially sponsored only)

        -   Relevant template contract/model agreement (if needed in
            addition to the Statement of Activities)

        -   Costing template (commercially sponsored only) or Schedule
            of Events (non-commercially sponsored only)

        -   Any other documents that the sponsor wishes to provide to
            the site to support the set up and delivery of the study

        -   Copy of HRA Initial Assessment letter (if one is issued) and
            (when issued) HRA Approval letter, and final versions of
            study documents.

Links

-   [UCL/UCLH JRO](https://www.ucl.ac.uk/joint-research-office/)

-   [Approach the
    JRO](https://www.ucl.ac.uk/joint-research-office/contact-us)    
    
## Safe settings

You should confirm that you are working at UCLH on approved
infrastructure. For example,

-   UCLH local and remote desktops

-   **or** UCLH Data Science Desktop

-   **or** a Generic Application Environment provisioned through EMAP    


## Safe outputs

You should confirm that

-   outputs must be non-disclosing

-   outputs must remain on UCLH systems until suitable publication
    clearance can be demonstrated

-   outputs will be archived as per any internal processes mandated by
    any of UCLH Information Services, Clinical Research Informatics Unit
    or the UCL/UCLH Joint Research Office

Outputs include

-   manuscripts or reports containing prose, tables and figures

-   software applications

-   statistical models (e.g. machine learning, artificial intelligence
    or similar)

-   data (electronic or otherwise)


## Safe data

You are expected to explain in your **Safe projects** application :

-   any requirement for access to

    -   direct or indirect identifiers otherwise a **pseudonymised
        identifier** will be provided

    -   sensitive information (e.g. HIV status, drug and alcohol
        history, mental health history etc.)

-   how your data request is proportionate. We suggest you provide clear
    limits by

    -   calendar period

    -   patient cohort

    -   data content

Further work to obscure or mask the data should not be necessary given
the other safeguards.

## Data access checklist

Safe people

-   all individuals have substantive contracts or educational
    relationships with higher education or NHS institutions

-   those working need to have evidence of experience of working with
    such data (e.g. previous training, previous work with ONS, data safe
    havens etc.) or they need a supervisor who can has similar
    experience

-   those working need to undergo training in information governance and
    issues with statistical disclosure control (SDC)

Safe projects

-   projects must \'serve the public good\'

-   projects must meet relevant HRA and UCLH research and ethics
    approvals

-   service delivery work mandated as per usual trust processes

Safe settings

-   working at UCLH in the NHS on approved infrastructure

    -   UCLH local and remote desktops

    -   UCLH Data Science Desktop

    -   EMAP

Safe outputs

-   outputs (e.g. reports, figures and tables) must be non-disclosing

-   outputs should remain on NHS systems initially

-   a copy of all outputs that are released externally (documents)
    should be stored in one central location so that there is visibility
    for all

Safe data

-   direct identifiers (hospital numbers, NHS numbers, names etc) should
    be masked unless there is an explicit justification for their use

-   data releases are proportionate (e.g. limited by calendar periods,
    by patient cohort etc.)

-   further work to obscure or mask the data is not necessary given the
    other safe guards (as per the recommendation by the UK data service)
