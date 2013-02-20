# spec/classes/jpackage_spec.rb

require 'spec_helper'

describe 'jpackage' do

  context 'when 6.0' do

    let(:params) do
      {:version => '6.0'}
    end

    let(:facts) do
      {:osfamily => 'RedHat'}
    end

    it 'install jpackage-generic (enabled)' do
      should contain_yumrepo('jpackage-generic').with({
        'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=6.0',
        'enabled'    => 1,
        'gpgcheck'   => 1,
        'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
      })
    end

    it 'does not install jpackage-generic-updates' do
      should_not contain_yumrepo('jpackage-generic-updates')
    end

    context 'when Fedora BETWEEN 9 AND 17' do

      let(:facts) do
        {:operatingsystem => 'Fedora',
          :os_maj_version => '17',
          :osfamily       => 'RedHat'}
      end

      it 'install jpackage-fc (disabled)' do
        should contain_yumrepo('jpackage-fc').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=fedora-17&type=free&release=6.0',
          'enabled'    => 0,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end

      it 'does not install jpackage-fc-updates' do
        should_not contain_yumrepo('jpackage-fc-updates')
      end

    end

    context 'when Fedora 18' do

      let(:facts) do
        {:operatingsystem => 'Fedora',
          :osfamily       => 'RedHat',
          :os_maj_version  => '18'}
      end

      it 'install jpackage-generic (enabled)' do
        should contain_yumrepo('jpackage-generic').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=6.0',
          'enabled'    => 1,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end

      it 'does not install jpackage-generic-updates' do
        should_not contain_yumrepo('jpackage-generic-updates')
      end
    end

    context 'when RedHat' do

      let(:facts) do
        {:operatingsystem => 'RedHat',
          :os_maj_version => '6',
          :osfamily       => 'RedHat'}
      end

      it 'install jpackage-generic (enabled)' do
        should contain_yumrepo('jpackage-generic').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=6.0',
          'enabled'    => 1,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end

      it 'does not install jpackage-generic-updates' do
        should_not contain_yumrepo('jpackage-generic-updates')
      end

    end

    context 'when other (here CentOS)' do

      let(:facts) do
        {:operatingsystem => 'CentOS',
          :osfamily       => 'RedHat',
          :os_maj_version  => '6'}
      end

      it 'install jpackage-generic (enabled)' do
        should contain_yumrepo('jpackage-generic').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=6.0',
          'enabled'    => 1,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end

      it 'does not install jpackage-generic-updates' do
        should_not contain_yumrepo('jpackage-generic-updates')
      end
    end


  end

  context 'when 5.0' do

    let(:params) do
      {:version => '5.0'}
    end

    let(:facts) do
      {:osfamily => 'RedHat'}
    end

    it 'install jpackage-generic (enabled)' do
      should contain_yumrepo('jpackage-generic').with({
        'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=5.0',
        'enabled'    => 1,
        'gpgcheck'   => 1,
        'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
      })
    end

    it 'install jpackage-generic-updates (enabled)' do
      should contain_yumrepo('jpackage-generic-updates').with({
        'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=5.0-updates',
        'enabled'    => 1,
        'gpgcheck'   => 1,
        'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
      })
    end


    context 'when Fedora BETWEEN 7 AND 14' do

      let(:facts) do
        {:operatingsystem => 'Fedora',
          :osfamily       => 'RedHat',
          :os_maj_version  => '12'}
      end

      it 'install jpackage-fc (disabled)' do
        should contain_yumrepo('jpackage-fc').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=fedora-12&type=free&release=5.0',
          'enabled'    => 0,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end

      it 'install jpackage-fc-updates (disabled)' do
        should contain_yumrepo('jpackage-fc-updates').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=fedora-12&type=free&release=5.0-updates',
          'enabled'    => 0,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end

    end

    context 'when Fedora 15 and over' do

      let(:facts) do
        {:operatingsystem => 'Fedora',
          :osfamily       => 'RedHat',
          :os_maj_version  => '18'}
      end

      it 'install jpackage-generic (enabled)' do
        should contain_yumrepo('jpackage-generic').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=5.0',
          'enabled'    => 1,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end

      it 'install jpackage-generic-updates (enabled)' do
        should contain_yumrepo('jpackage-generic-updates').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=5.0-updates',
          'enabled'    => 1,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end
    end

    context 'when RedHat 4.x or 5.x' do

      let(:facts) do
        {:operatingsystem => 'RedHat',
          :osfamily       => 'RedHat',
          :os_maj_version  => '5'}
      end

      it 'install jpackage-rhel (disabled)' do
        should contain_yumrepo('jpackage-rhel').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=redhat-el-5&type=free&release=5.0',
          'enabled'    => 0,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end

      it 'install jpackage-rhel-updates (disabled)' do
        should contain_yumrepo('jpackage-rhel-updates').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=redhat-el-5&type=free&release=5.0-updates',
          'enabled'    => 0,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end

    end

    context 'when RedHat 6.x' do

      let(:facts) do
        {:operatingsystem => 'RedHat',
          :osfamily       => 'RedHat',
          :os_maj_version  => '6'}
      end

      it 'install jpackage-generic (enabled)' do
        should contain_yumrepo('jpackage-generic').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=5.0',
          'enabled'    => 1,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end

      it 'install jpackage-generic-updates (enabled)' do
        should contain_yumrepo('jpackage-generic-updates').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=5.0-updates',
          'enabled'    => 1,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end
    end

    context 'when other (here CentOS)' do

      let(:facts) do
        {:operatingsystem => 'CentOS',
          :osfamily       => 'RedHat',
          :os_maj_version  => '6'}
      end

      it 'install jpackage-generic (enabled)' do
        should contain_yumrepo('jpackage-generic').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=5.0',
          'enabled'    => 1,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end

      it 'install jpackage-generic-updates (enabled)' do
        should contain_yumrepo('jpackage-generic-updates').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=5.0-updates',
          'enabled'    => 1,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end
    end


  end

end
