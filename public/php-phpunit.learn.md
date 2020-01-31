---
title: PHP - PHPUnit
---

Install Testing Framework
=========================

<https://www.youtube.com/watch?v=9zoHWNR5OcQ>

1.  Install the testing Framework 


    composer require --dev typo3/testing-framework

2.  Make sure we have PHP binary executable in PHPStorm settings, xdebug must be installed 
3.  Use Composer autoload to load PHPunit
4.  Edit configuration and TYPO3_PATH_ROOT = /Users/fudriot/
5.  Default configuration should be taken from EXT:core

How can I run TYPO3 unit tests?
----------

For TYPO3 core:

```php
vendor/bin/phpunit -c typo3/sysext/Core/Build/UnitTest.xml
```

For a TYPO3 extension:

```php
vendor/bin/phpunit -c vendor/typo3/testing-framework/Resources/Core/Build/UnitTests.xml web/typo3conf/ext/userjungfrausite/Tests/Unit/
```

It can be hand to have a quick `Makefile` to watch the file system and run the Unit Tests on file change.

```makefile
VENDOR ?= "../../../../vendor"

P="\\033[34m[+]\\033[0m"

help:
	@echo
	@echo "  \033[34munit-tests\033[0m – Unit test the extension."
	@echo "  \033[34mwatch\033[0m      – Watch the PHP unit files and run unit tests upon file change."
	@echo

unit-tests:
	@echo "  $(P) Unit Tests"
	@$(VENDOR)/bin/phpunit -c $(VENDOR)/typo3/testing-framework/Resources/Core/Build/UnitTests.xml Tests/Unit

watch:
	@echo "  $(P) Unit Tests"
	@while inotifywait -e close_write Tests/Unit/* -e close_write Classes/Service/*; do make unit-tests; done

.PHONY: help unit-tests watch
```



A php.ini scanner for best security practices
---------------------------------------------

<https://github.com/psecio/iniscan> (instruction how to install was not accurate, wrote an issue)

We can use a PHP wrapper
-------

TODO: check with me!

```sh
/Users/fudriot/Forge/PHPUnit/bin/php
```

Helmut blog
-----------

<http://www.derhansen.de/2014/06/standalone-unit-and-functional-tests.html> (&lt;-- look here)
<http://insight.helhum.io/post/63972451370/executing-typo3-cms-unit-test-tests-in-phpstorm>

PHPStorm preferences
--------------------

*   Configure Core `cd typo3_src; composer install`
*   Configure interpreter
*   Configure path phpunit

Edit configuration
------------------

With images:

    open /Users/fudriot/Documents/Courses/PhpUnit/ConfigurePhpStorm.png
    open /Users/fudriot/Documents/Courses/PhpUnit/ConfigurePhpStormPhpunitPath.png

*   Use alternative configuration file
            \-> open typo3_src/sysext/core/Build/UnitTests.xml
    
*   Environment variables
    TYPO3_PATH_WEB=/Users/fudriot/Sites/Visol/easyvote.ch/htdocs (don't forget)

typo3DatabaseName="unittest"  typo3DatabaseHost="localhost"  typo3DatabaseUsername="root" typo3DatabasePassword="root" \\
./bin/phpunit -c typo3/sysext/core/Build/FunctionalTests.xml

typo3/sysext/impexp/Tests/Functional/ImportFromVersionFourDotFive/PagesAndTtContentWithRteImagesAndFileLink/ImportInEmptyDatabaseTest.php

    /**
     * @return void
     */
    public function setUp() 
    {
        parent::setUp();
    }
    
    /**
     * @return void
     */
    public function tearDown() 
    {
        parent::tearDown();
    }

How can I test a protected method?
---------

```php
$method = new \ReflectionMethod(
    \ClassName::class,
    'buildUrl'
);
$method->setAccessible(TRUE);
$this->assertEquals(
    'blah',
    $method->invoke(new \ClassName(), 'args1')
);
```

Test Double
-----------

```php
$extractorObject1 = $this->getMock(
    \TYPO3\CMS\Core\Resource\Index\ExtractorInterface::class,
    array(),
    array(),
    $extractorClass1
);

$extractorObject1
    ->expects(
        $this->any()
    )
    ->method('getPriority')->will($this->returnValue(1))
);
```

Functional Test
---------------

phpunit -c typo3/sysext/core/Build/FunctionalTests.xml typo3/sysext/core/Tests/Functional

[TASK] Use composer for unit and functional tests in travis
-----------------------------------------------------------

<https://review.typo3.org/#/c/29495>

The patch uses composer based dependency handling and other
stuff pushing travis-ci tests to the next level:

*   phpunit registered as "dev" requirement in composer.json
*   vfsStream registered as "dev" requirement in composer.json
*   cms-composer-installers is not released stable and adapted
    in composer.json for successful dependency resolving via
    composer
*   cloning travis-integration repository is obsolete by inlining
    scripts in .travis.yml
*   cloning ext:phpunit is obsolete, native phpunit by composer
    is used now
*   it is possible to set functional test suite database credentials
    with environment variables, used in .travis.yml
*   redis cache backend tests are enabled on travis-ci again
*   use existing php modules of travis-ci environment speeds up build

With phpunit from composer, the command to run tests is
./bin/phpunit -c typo3/sysext/core/Build/UnitTests.xml
More documentation about that can be found at
<http://wiki.typo3.org/Unit_Testing_TYPO3>

Filter test
-----------

    •   you can use the @group tag in the class documentation to indicate the group and then run tests only on that group using --group
    •   you can use     er to only run tests that match a given regex

Private Method
--------------

    /**
     * @test
     */
    public function getMarkerTemplateReturnsDefaultMarker() 
    {
        $method = new ReflectionMethod(
            'Tx_ManpowerEmailtemplates_Domain_Model_Template', 'getMarkerTemplate'
        );
    
        $method->setAccessible(TRUE);
    
        $actual = $method->invoke($this->fixture);
        $actual = $method->invokeArgs($this->fixture, array($foo));
    }

Provider
--------

    /**
     * @test
     * @dataProvider propertyProvider
     */
    public function testProperty($propertyName, $value) 
    {
        $setter = 'set' . ucfirst($propertyName);
        $getter = 'get' . ucfirst($propertyName);
        $actual = call_user_func_array(array($this->fixture, $setter), array($value));
        $this->assertTrue($actual instanceof Tx_ManpowerSearchform_Domain_Model_Subsidiary);
        $this->assertEquals($value, call_user_func(array($this->fixture, $getter)));
    }
    
    /**
     * Provider
     */
    public function propertyProvider() 
    {
        return array(
            array('markers', uniqid('foo')),
            array('addAttachment', t3lib_extMgm::extPath('manpower_emailtemplates') . 'Tests/Resources/Sample.pdf'),
            array('dryRun', NULL),
        );
    }

Extends
-------

class QueryTest extends \\TYPO3\\CMS\\Core\\Tests\\UnitTestCase {
class QueryTest extends \\TYPO3\\CMS\\Extbase\\Tests\\Unit\\BaseTestCase {

CheckList
---------

1.  variable is exported

export ENV_TYPO3_SITE_PATH='/Users/fudriot/Sites/Ecodev/bootstrap.master/htdocs'
export ENV_DEBUG=1

2.  PHP Interpreter is configured in PHPStorm

3.  EXT:phpunit is installed
    git clone git://git.typo3.org/TYPO3CMS/Extensions/phpunit.git

4.  BE User \_cli_phpunit exists

Configure Stub
--------------

<http://www.phpunit.de/manual/current/en/test-doubles.html>

Matchers
--------

<http://stackoverflow.com/questions/7432458/phpunit-expects-method-meaning>

any() returns a matcher that matches when the method it is evaluated for is executed zero or more times.
never() returns a matcher that matches when the method it is evaluated for is never executed.
atLeastOnce() returns a matcher that matches when the method it is evaluated for is executed at least once.
once() returns a matcher that matches when the method it is evaluated for is executed exactly once.
exactly(int $count) returns a matcher that matches when the method it is evaluated for is executed exactly $count times.
at(int $index) returns a matcher that matches when the method it is evaluated for is invoked at the given $index

All About Mocking with PHPUnit - article
----------------------------------------

<http://net.tutsplus.com/tutorials/php/all-about-mocking-with-phpunit/>

Getting familiar with PHPUnit Mocks (CakePHP)
---------------------------------------------

<http://mark-story.com/posts/view/getting-familiar-with-phpunit-mocks>



```php
$mock = $this->getMock('Thing');
$mock->expects($this->at(0))->method('send')
    ->with('one', 'two')
    ->will($this->returnValue(true));

/*
•   once() Will fail if the method is called more than once, or less than once.
•   never() Will fail if the method is called ever.
•   any() Will always match
•   at($index) Will match at call $index. A very important and possibly irritating difference between the SimpleTest implementation is the index increments each time a mock method is called, not just when the indicated method is called.
•   exactly($times) Will only pass if the method is called $times. I find this one doesn’t work well with with().
•   atLeastOnce() Will pass if the method is called more than once.
*/
```

Usually, the next thing in the chain is a method($methodName) call, which specifies which method the expectation is for. Following method() is usually one or both of with() and will(). Parameter expectations are supplied as parameters to with(). You can either supply the literal values you are expecting, or one of the many constraint objects PHPUnit has. Return values for mocked methods are set with will(). Will accepts a ‘stub’ as its parameter, and there are several built in stub types.
    •   returnValue($value) Return a literal value, like a string or an array or a boolean.
    •   throwException($exception) Make the method throw an exception.
    •   returnArgument($index) Return the argument at $index
    •   returnCallback() Allows you to return ‘callback type’ results. For example in PHP5.3 you can return anonymous functions.
    •   onConsecutiveCalls() Allows you to setup a return value ‘script’. This allows you to setup a number of return values that will be returned in the sequence they are provided. This stub works best with either any() or atLeastOnce() in my experience.

Slides about new features in PHPUnit 3.3
----------------------------------------

BEHAVIOUR DRIVEN DEVELOPMENT
----------------------------

<http://www.slideshare.net/sebastian_bergmann/new-features-in-phpunit-33>

<http://blog.daveastels.com/files/BDD_Intro.pdf>

getMock will
------------

    $mockObject = $this->getMock('t3lib_cache_Manager', array('getCache'));
    $mockObject->expects($this->any())->method('getCache')->will($this->returnValue($mockCache));

getMock once
------------

    $registryMock = $this->getMock('t3lib_category_Registry', array('add'));
    $registryMock->expects($this->once())->method('add')->with($extensionKey, $tableName, $fieldName);
    t3lib_div::setSingletonInstance('t3lib_category_Registry', $registryMock);

VFSSTREAM - MOCKING FILE
------------------------

<https://github.com/mikey179/vfsStream/wiki>

<http://www.stubbles.org/>

Exception with phpunit
----------------------

```php
 /**
  * @expectedException MyExceptionClass
  * @expectedExceptionMessage Array too small
  */
```

OR

```php
$this->setExpectedException('Exception');
```



Improved Skeleton Generator in PHPUnit 3
----------------------------------------

<http://sebastian-bergmann.de/archives/628-Improved-Skeleton-Generator-in-PHPUnit-3.html>

TEST UNITAIRE JUNIT
-------------------

\-> aussi tester simpletest
<http://www.onpk.net/index.php/2008/05/23/449-au-revoir-selenium-simpletest-revient-et-jqunit-arrive>

Test qualité:

*   PHP_CodeSniffer tokenises PHP, JavaScript and CSS files and detects violations of a defined set of coding standards.
*   phpmd scans PHP source code and looks for potential problems such as possible bugs, suboptimal code or overcomplicated expressions.
*   phpcpd is a Copy/Paste Detector (CPD) for PHP code.
*   PHP_Depend is a PHP software metrics tool.
*   PHPUnit is the de-facto standard unit test framework for PHP.

<http://sebastian-bergmann.de/archives/856-Quality-Assurance-Tools-for-PHP.html>

Fixtures:
A test fixture is something used to consistently test some item, device, or piece of software.
<http://www.phpunit.de/manual/3.4/en/fixtures.html>

ALTERNATIVE TO SCENARIO - PHPSPEC
---------------------------------

<http://devzone.zend.com/article/3082> (good article)
   Story: I have a savings and current account and I want
        to transfer money from savings to current.

    Scenario: savings account has enough money
        Given my savings account balance is 100
        And my current account balance is 50
        When I transfer 20 from savings to current
        Then my savings account balance should be 80
        And my current account balance should be 70