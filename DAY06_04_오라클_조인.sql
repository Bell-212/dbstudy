-- 내부조인

-- 1. 사원번호, 사원명, 부서번호, 부서명을 조회하시오.
SELECT E.EMPLOYEE_ID
     , E.FIRST_NAME
     , E.LAST_NAME
     , D.DEPARTMENT_ID  -- 2개의 테이블에 모두 있는 칼럼(이름이 같은 칼럼)은 반드시 테이블(오너)을 명시해야 한다.      
     , D.DEPARTMENT_NAME
  FROM DEPARTMENTS D, EMPLOYEES E           --INNER JOIN 대신 콤마(,)를 사용한다.
 WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID;   --ON 대신 WHERE을 사용한다.
    
-- 2. 사원번호, 사원명, 직업, 연봉, 직업별 최대연봉, 직업별 최소연봉을 조회하시오.
SELECT E.EMPLOYEE_ID
     , E.FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME
     , J.JOB_ID
     , E.SALARY
     , J.MAX_SALARY
     , J.MIN_SALARY
  FROM JOBS J, EMPLOYEES E
 WHERE J.JOB_ID = E.JOB_ID;
    

-- 외부 조인

-- 3. 모든 사원들의(부서가 없는 사원도 포함) 사원번호, 사원명, 부서번호, 부서명을 조회하시오.
SELECT E.EMPLOYEE_ID
     , E.FIRST_NAME
     , E.LAST_NAME
     , D.DEPARTMENT_ID
     , D.DEPARTMENT_NAME
  FROM DEPARTMENTS D, EMPLOYEES E -- 오른쪽 테이블(EMPLOYEES)의 모든 데이터를 조회하시오. (부서번호가 없는 사원도 조회하시오.)
 WHERE D.DEPARTMENT_ID(+) = E.DEPARTMENT_ID; --RIGHT OUTER JOIN은 반대방향(LEFT)에 (+)를 추가한다.

-- 4. 사원번호, 사원명, 부서번호, 부서명을 조회하시오. 사원이 근무하지 않는 유령부서도 조회하시오.
SELECT E.EMPLOYEE_ID
     , E.FIRST_NAME
     , E.LAST_NAME
     , D.DEPARTMENT_ID
     , D.DEPARTMENT_NAME
  FROM DEPARTMENTS D, EMPLOYEES E -- 왼쪽 테이블(DEPARTMENTS)의 모든 데이터를 조회하시오. (사원이 존재하지 않는 부서도 조회하시오.)
 WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID(+); --LEFT OUTER JOIN은 반대방향(RIGHT)에 (+)를 추가한다.



-- 3개 이상 테이블 조인하기

-- 5. 사원번호, 사원명, 부서번호, 부서명, 근무지역을 조회하시오.
SELECT EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , D.DEPARTMENT_ID
     , DEPARTMENT_NAME
     , L.LOCATION_ID
     , CITY
  FROM LOCATIONS L,DEPARTMENTS D, EMPLOYEES E
 WHERE L.LOCATION_ID = D.LOCATION_ID 
   AND D.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- 6. 부서번호, 부서명, 근무지역도시, 근무지역국가(부서, 근무지역, 국가 테이블 조인)
SELECT D.DEPARTMENT_ID
     , D.DEPARTMENT_NAME
     , L.LOCATION_ID
     , L.CITY
     , C.COUNTRY_NAME
  FROM COUNTRIES C, LOCATIONS L, DEPARTMENTS D 
 WHERE C.COUNTRY_ID = L.COUNTRY_ID 
   AND L.LOCATION_ID = D.LOCATION_ID;
